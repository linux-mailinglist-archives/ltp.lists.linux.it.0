Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A52AFFB0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:31:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 200373C2EEE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 07:31:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 88AAA3C262E
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:31:20 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6AA0B1000A9C
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 07:31:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,471,1596470400"; d="scan'208";a="101270088"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Nov 2020 14:31:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2549A4CE4B09;
 Thu, 12 Nov 2020 14:31:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 12 Nov 2020 14:31:12 +0800
Message-ID: <5FACD6B0.8080908@cn.fujitsu.com>
Date: Thu, 12 Nov 2020 14:31:12 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1604317409-22871-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201111150926.GA21539@yuki.lan>
In-Reply-To: <20201111150926.GA21539@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2549A4CE4B09.ACFE1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/ptrace02: Add another EPERM error
 test
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
>> +static void verify_ptrace(void)
>> +{
>> +	int child_pid;
>> +
>> +	tst_res(TINFO, "Trace a process that don't have CAP_SYS_PTRACE capability(nobody user) for it");
>
> I wouldn't be printing this verbose info here, anyone who will have to
> debug the test failures will look into the source code and at the test
> description in the top level comment.
Will remove it.
>
>> +	child_pid = SAFE_FORK();
>> +	if (!child_pid)
>> +		pause();
>> +
>> +	if (!SAFE_FORK()) {
>> +		SAFE_SETUID(uid);
>> +		TEST(ptrace(PTRACE_ATTACH, child_pid, NULL, NULL));
>> +		if (TST_RET == 0) {
>> +			tst_res(TFAIL, "ptrace() succeeded unexpectedly");
>> +			TST_CHECKPOINT_WAKE(0);
>> +			exit(0);
>> +		}
>> +		if (TST_ERR == EPERM)
>> +			tst_res(TPASS | TTERRNO, "ptrace() failed as expected");
>> +		else
>> +			tst_res(TFAIL | TTERRNO, "ptrace() expected EPERM, but got");
>> +		TST_CHECKPOINT_WAKE(0);
>> +		exit(0);
>> +	}
>> +	TST_CHECKPOINT_WAIT(0);
>> +	SAFE_KILL(child_pid, SIGKILL);
>> +	SAFE_WAITPID(child_pid, NULL, 0);
>
> We do not need the checkpoints here at all, we just need to waitpid for
> the second child before we kill the first one.
Yes, Will fix it in v2.
>
>> +	tst_reap_children();
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	struct passwd *pw;
>> +
>> +	pw = SAFE_GETPWNAM("nobody");
>> +	uid = pw->pw_uid;
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.test_all = verify_ptrace,
>> +	.forks_child = 1,
>> +	.needs_root = 1,
>> +	.needs_checkpoints = 1,
>> +};
>> --
>> 2.23.0
>>
>>
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
