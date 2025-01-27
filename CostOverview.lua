addonName, CraftSim = ...

CraftSim.COSTOVERVIEW = {}

function CraftSim.COSTOVERVIEW:CalculateCostOverview(recipeData, recipeType, priceData, craftingCostsOnly)
    -- calculate profit for qualities from current until max
    local profitByNextQualities = {}
    if not craftingCostsOnly then
        for i = recipeData.expectedQuality, recipeData.maxQuality, 1 do
            local currRecipeData = CopyTable(recipeData)
            currRecipeData.expectedQuality = i
            local meanProfitCurrentQuality = (priceData.minBuyoutPerQuality[i] * recipeData.baseItemAmount) * CraftSim.CONST.AUCTION_HOUSE_CUT - priceData.craftingCostPerCraft
            table.insert(profitByNextQualities, meanProfitCurrentQuality)
        end
    end

    CraftSim.FRAME:FillCostOverview(priceData.craftingCostPerCraft, priceData.minimumCostPerCraft, profitByNextQualities, recipeData.expectedQuality)
end