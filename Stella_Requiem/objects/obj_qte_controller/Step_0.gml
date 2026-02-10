switch (state)
{
    case QTE_STATE.PLAYING:
        timer++;

        if (timer >= max_time)
        {
            state  = QTE_STATE.FAIL;
            result = 1; // fail
        }
        break;


    case QTE_STATE.SUCCESS:
    case QTE_STATE.FAIL:

        if (instance_exists(qte_object))
        {
            with (qte_object) instance_destroy();
        }

        global.qte_result = result;
        state = QTE_STATE.IDLE;
        break;
}
