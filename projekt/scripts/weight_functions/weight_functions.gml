function SetWeights() {
    maxInventoryWeight = 8;
    weightChangeValue = [2, 4, 6, maxInventoryWeight];
    weightLevels = [0, 1, 2, 3];
}

function ChangeWeight() {
    if (inventoryWeight < weightChangeValue[0]) {
        currentWeightLevel = weightLevels[0];
    } else if (inventoryWeight < weightChangeValue[1]) {
        currentWeightLevel = weightLevels[1];
    } else if (inventoryWeight < weightChangeValue[2]) {
        currentWeightLevel = weightLevels[2];
    } else {
        currentWeightLevel = weightLevels[3];
    }
}
