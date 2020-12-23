Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94C2E1A38
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 09:57:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA7B93C2DBC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 09:57:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C863D3C296E
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 09:57:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 677241400DA9
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 09:57:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,441,1599494400"; d="scan'208";a="102862152"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Dec 2020 16:57:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F37694CE6023
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 16:57:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Dec 2020 16:57:23 +0800
Message-ID: <5FE30676.8060004@cn.fujitsu.com>
Date: Wed, 23 Dec 2020 16:57:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
References: <1608626908-8117-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1608626908-8117-3-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1608626908-8117-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F37694CE6023.AC95C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-2.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/ipc: semctl09: add a test for
 SEM_STAT_ANY
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

Hi Feiyu

> +#include<stdio.h>
> +#include<pwd.h>
> +#include<sys/sem.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +#include "lapi/semun.h"
> +#include "lapi/sem.h"
I doubt do we really need two lapi headers, maybe we can remove semun.h 
and remove union struct definition into lapi/sem.h.
> +#include "lapi/syscalls.h"
> +
> +static int sem_id = -1;
> +static uid_t nobody_uid, root_uid;
> +static union semun un;
> +
> +static inline int tst_sys_semctl(int semid, int semnum, int cmd)
> +{
> +	return tst_syscall(__NR_semctl, semid, semnum, cmd,&un.buf);
It looks like semctl man-pages has wrong description. We should use 
sem_ds struct instead of seminfo struct. I have sent a patch[1] to 
man-pages community.

[1]https://github.com/linux-mailinglist-archives/linux-man.vger.kernel.org.0/commit/f2bda64c45a38ba7c895716908321f34ddd25cdc
> +}
> +
> +static inline int tst_semctl(int semid, int semnum, int cmd)
> +{
> +	return semctl(semid, semnum, cmd,&un.buf);
> +}
> +
Since we test glibc and syscall,  I think we should use test_variants 
like semop case.
> +static struct tcases {
> +	uid_t *uid;
> +	int (*test_semctl) ();
> +	char *desc;
> +} tests[] = {
> +	{&nobody_uid, tst_sys_semctl, "with nobody user by syscall()",},
> +	{&nobody_uid, tst_semctl, "with nobody user",},
> +	{&root_uid, tst_sys_semctl, "with root user by syscall()",},
> +	{&root_uid, tst_semctl, "with root user",}
> +};
> +
> +static void parse_proc_sysvipc(struct seminfo *info)
> +{
> +	FILE *f = fopen("/proc/sysvipc/sem", "r");
> +	int semset_cnt = 0;
> +	int sem_cnt = 0;
> +
> +	/* Eat header */
> +	for (;;) {
> +		int c = fgetc(f);
> +
> +		if (c == '\n' || c == EOF)
> +			break;
> +	}
> +
> +	int nsems;
> +	/*
> +	 * Sum sem set, nsems for all elements listed, which should equal
> +	 * the data returned in the seminfo structure.
> +	 */
> +	while (fscanf(f, "%*i %*i %*i %i %*i %*i %*i %*i %*i %*i",
> +		&nsems)>  0){
> +		semset_cnt++;
> +		sem_cnt += nsems;
> +	}
> +
> +	if (info->semusz != semset_cnt) {
> +		tst_res(TFAIL, "semusz = %i, expected %i",
> +				info->semusz, semset_cnt);
> +	} else {
> +		tst_res(TPASS, "semset_cnt = %i", semset_cnt);
> +	}
> +
> +	if (info->semaem != sem_cnt) {
> +		tst_res(TFAIL, "semaem = %i, expected %i",
> +				info->semaem, sem_cnt);
> +	} else {
> +		tst_res(TPASS, "sen_cnt = %i", sem_cnt);
> +	}
> +
> +	fclose(f);
> +}
> +
> +static void verify_semctl(unsigned int n)
> +{
> +	struct tcases *tc =&tests[n];
> +	int i, semid, cnt = 0;
> +	struct seminfo info;
> +	union semun arg;
> +
> +	tst_res(TINFO, "Test SEM_STAT_ANY %s", tc->desc);
> +
> +	SAFE_SETEUID(*tc->uid);
> +
> +	arg.__buf =&info;
> +
> +	TEST(semctl(sem_id, 0, SEM_INFO, arg));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "semctl(sem_id, 0, SEM_INFO, ...)");
> +		return;
> +	}
> +
> +	semid = (*tc->test_semctl) (TST_RET, 0, SEM_STAT_ANY);
> +
> +	if (errno == EFAULT) {
> +		tst_res(TFAIL, "SEM_STAT_ANY doesn't pass the buffer "
> +				"specified by the caller to kernel");
> +		return;
> +	} else if (semid == -1) {
> +		tst_res(TFAIL | TTERRNO, "SEM_INFO haven't returned a valid index");
> +	} else {
> +		tst_res(TPASS, "SEM_INFO returned valid index %li to semid %i",
> +			TST_RET, semid);
> +	}
> +
> +	for (i = 0; i<= TST_RET; i++) {
> +		if (((*tc->test_semctl) (i, 0, SEM_STAT_ANY)) != -1)
> +			cnt++;
> +	}
> +
> +	if (cnt == info.semusz) {
> +		tst_res(TPASS, "Counted used = %i", cnt);
> +	} else {
> +		tst_res(TFAIL, "Counted used = %i, semuse = %i",
> +			cnt, info.semusz);
> +	}
> +
> +	parse_proc_sysvipc(&info);
> +}
> +
> +static void setup(void)
> +{
> +	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
> +	nobody_uid = ltpuser->pw_uid;
> +	root_uid = 0;
> +
> +	sem_id = SAFE_SEMGET(IPC_PRIVATE, 2, IPC_CREAT | 0600);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (sem_id>= 0)
> +		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test = verify_semctl,
> +	.tcnt = ARRAY_SIZE(tests),
> +	.needs_root = 1,
> +};




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
