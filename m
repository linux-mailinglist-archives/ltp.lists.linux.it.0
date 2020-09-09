Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B138262525
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 04:23:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1BD63C2CA3
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 04:23:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 19C903C2672
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 04:23:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2A17C6008E4
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 04:23:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,408,1592841600"; d="scan'208";a="99039407"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Sep 2020 10:23:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0960B48990E1;
 Wed,  9 Sep 2020 10:23:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 9 Sep 2020 10:23:13 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200814132855.GC5559@yuki.lan>
 <1597727924-4969-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200908140838.GB17482@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <97b07cd4-ab97-ed5a-7bbb-ceef072b7e61@cn.fujitsu.com>
Date: Wed, 9 Sep 2020 10:23:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908140838.GB17482@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0960B48990E1.A026D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/msgrcv07: Add functional test for
 MSG_COPY flag
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril

> Hi!
>> +static void test_msg_copy(void)
>> +{
>> +	struct msqid_ds buf = {0};
>> +
>> +	if (!msg_copy_sup) {
>> +		tst_res(TCONF, "kernel doesn't support MSG_COPY flag, skip it");
>> +		return;
>> +	}
>> +	prepare_queue();
>> +
>> +	/*
>> +	 * If MSG_COPY flag was specified, then mtype is interpreted as number
>> +	 * of the message to copy.
>> +	 */
>> +	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 0, MSG_COPY | IPC_NOWAIT);
>> +	if (strcmp(rcv_buf.mtext, MSG1) == 0 && rcv_buf.type == MSGTYPE1)
>> +		tst_res(TPASS, "msgrcv(MSG_COPY) got MSGTYPE1 msg data"
>> +			" correctly");
>> +	else
>> +		tst_res(TFAIL, "msgrcv(MSG_COPY) got MSGTYPE1 msg data"
>> +			" incorrectly");
>> +
>> +	SAFE_MSGRCV(queue_id, &rcv_buf, MSGSIZE, 1, MSG_COPY | IPC_NOWAIT);
>> +	if (strcmp(rcv_buf.mtext, MSG2) == 0 && rcv_buf.type == MSGTYPE2)
>> +		tst_res(TPASS, "msgrcv(MSG_COPY) got MSGTYPE2 msg data"
>> +			" correctly");
>> +	else
>> +		tst_res(TFAIL, "msgrcv(MSG_COPY) got MSGTYPE2 msg data"
>> +			" incorrectly");
> 
> Can we please keep the strings on a single line?
> 
> I guess that we can shorten the messages a bit e.g.
> 
> tst_res(TFAIL, "msgrcv(MSG_COPY) got MSGTYPE2 data correctly");
> 
> Or even:
> 
> tst_res(TFAIL, "MSG_COPY got MSGTYPE2 data correctly");
> 
> Please try to keep the messages short and to the point.
Will fix it.
> 
>> +	SAFE_MSGCTL(queue_id, IPC_STAT, &buf);
>> +	if (buf.msg_qnum == 2)
>> +		tst_res(TPASS, "msgrcv(MSG_COPY) succeeded, msg queue "
>> +			"still has 2 msg");
>> +	else
>> +		tst_res(TFAIL, "msgrcv(MSG_COPY) msg queue expected 2 msg num,"
>> +			" but only got %d", (int)buf.msg_qnum);
> 
> Here as well we can shorten it to something as:
> 
> 	tst_res(TPASS, "Two messages still in queue");
> 
> 	tst_res(TFAIL, "Expected 2 msgs in queue got %i",
> 		(int)buf.msg_qnum);
> 
Will fix it.
>> +	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
>> +}
>> +
>>   static void test_zero_msgtyp(void)
>>   {
>>   	prepare_queue();
>> @@ -159,11 +203,28 @@ static void test_negative_msgtyp(void)
>>   static void setup(void)
>>   {
>>   	msgkey = GETIPCKEY();
>> +	prepare_queue();
>> +	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, MSGTYPE1, MSG_COPY));
>> +	if (TST_RET != -1)
>> +		tst_res(TINFO, "msgrcv succeeded unexpectedly, kernel doesn't"
>> +			" support MSG_COPY flag");
>> +
>> +	if (TST_ERR == EINVAL) {
>> +		tst_res(TINFO, "msgrcv failed as expected when not using"
>> +			" MSG_COPY and IPC_NOWAIT concurrently");
>> +		msg_copy_sup = 1;
>> +	} else if (TST_ERR == ENOSYS) {
>> +		tst_res(TINFO, "kernel doesn't enable CONFIG_CHECKPOINT_RESTORE");
>> +	} else {
>> +		tst_res(TINFO | TTERRNO, "msgrcv failed when not using MSG_COPY"
>> +			"and IPC_NOWAIT concurrently, expected EINVAL but got");
>> +	}
> 
> This check actually does not work, it fails to detect the support on
> newer kernels, e.g. 5.6.1 without the CONFIG_CHECKPOINT_RESTORE.
> 
> When kernel is new enough call to msgrcv() with MSG_COPY without
> IPC_NOWAIT returns EINVAL even without CONFIG_CHECKPOINT_RESTORE I guess
> that the flags are checked in the generic code and not ifdefed out. You
> will get ENOSYS only on correct combination i.e. MSG_COPY | IPC_NOWAIT.\
Yes, I understand your meaning.
> 
> So why don't we rather:
> 
> * Check if the kernel is older than 3.8 and skip the MSG_COPY test when
>    it is
> 
> * Check for ENOSYS in the test_msg_copy() function
> 
> These two conditions should cover all possible cases.
Yes. msgrcv03 uses this way. Will fix it on v3.
Thanks for your explanation.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
