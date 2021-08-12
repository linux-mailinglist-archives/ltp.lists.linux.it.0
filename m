Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C53EA4FF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 14:57:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 864303C6DE0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 14:57:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B001A3C1825
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 14:57:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C11F1400055
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 14:57:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C5F32226A;
 Thu, 12 Aug 2021 12:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628773049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Awmy87I8m2Srj+TyMjfrEtLMK32hMTYvEbwasuClx8=;
 b=IqUwsSeP/qp0vZrlkNq3Wzum5iBu+I+aGpLu+F63TvydyZs9RppF4nqn90TVz6jettMGEQ
 MFxzjCwkL0o/kNQHzTceWqsqC0Sfv5oiJmmEKdkWpUwAES2baTxwg8n+ivCDfiEbmabECF
 3g78Ds96cuJpXTYloDtY0RIH3wgJ2Zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628773049;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Awmy87I8m2Srj+TyMjfrEtLMK32hMTYvEbwasuClx8=;
 b=kYkjWLvZk1CC8acGyk1+BcRVhkptck3e3S1glyJfHSAfggoQaKRoWZV2PEHW583pQgTDq8
 cGZQagU09tZSUQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7222513C49;
 Thu, 12 Aug 2021 12:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k2yhGrkaFWHnbwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 12 Aug 2021 12:57:29 +0000
Date: Thu, 12 Aug 2021 14:57:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YRUaxQjWFSw9Y4J1@yuki>
References: <20210811122235.1627-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811122235.1627-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 5/6] syscalls/sysfs: Convert sysfs05 to the new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> -char *TCID = "sysfs05";
> -static int option[3] = { 1, 4, 1 };	/* valid and invalid option */
> -static char *fsname[] = { "ext0", " ext2", (char *)-1 };
> -
> -static struct test_case_t {
> -	char *err_desc;		/*error description */
> -	int exp_errno;		/* expected error number */
> -	char *exp_errval;	/*Expected errorvalue string */
> -} testcase[] = {
> -	{
> -	"Invalid option", EINVAL, "EINVAL"}, {
> -	"Invalid filesystem name", EINVAL, "EINVAL "}, {
> -	"Address is out of your address space", EFAULT, "EFAULT "}
> +
> +char *bad_addr;
> +
> +static struct test_case {
> +	int option;
> +	char *fsname;
> +	int fsindex;
> +	char *err_desc;
> +	int exp_errno;
> +} tcases[] = {
> +	{1, "ext0", 0, "Invalid filesystem name", EINVAL},
> +	{4, "ext4", 0, "Invalid option", EINVAL},
> +	{1, (char *)-1, 0, "Address is out of your address space", EFAULT},
> +	{2, NULL, 1000, "fs_index is out of bounds", EINVAL}
>  };
> 
> -int TST_TOTAL = ARRAY_SIZE(testcase);
> -
> -int main(int ac, char **av)
> +static void verify_sysfs05(unsigned int nr)
>  {
> -	int lc, i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -
> -			tst_count = 0;
> -			TEST(ltp_syscall(__NR_sysfs, option[i], fsname[i]));
> +
> +	if (nr < 3)
> +		TST_EXP_FAIL(tst_syscall(__NR_sysfs, tcases[nr].option, tcases[nr].fsname),
> +					tcases[nr].exp_errno, "%s", tcases[nr].err_desc);
> +	else
> +		TST_EXP_FAIL(tst_syscall(__NR_sysfs, tcases[nr].option, tcases[nr].fsindex, bad_addr),
> +					tcases[nr].exp_errno, "%s", tcases[nr].err_desc);

Depending on the index here is ugly hack and there is absolutelly no
reason to do so. We can switch on the option easily instead with:

	if (tcases[nr].option == 1) {
		/* call with fsname */
	} else {
		/* call with fs index */
	}


Also tests usually store a pointer to the current testcases at the start
of the verify function to make the code slightly shorter as:

static void verify_foo(unsigned int n)
{
	struct tcase *tc = &tcases[n];

	if (tc->option == 1) {

...

}

> -			/* check return code */
> -			if ((TEST_RETURN == -1)
> -			    && (TEST_ERRNO == testcase[i].exp_errno)) {
> -				tst_resm(TPASS,
> -					 "sysfs(2) expected failure;"
> -					 " Got errno - %s : %s",
> -					 testcase[i].exp_errval,
> -					 testcase[i].err_desc);
> -			} else {
> -				tst_resm(TFAIL, "sysfs(2) failed to produce"
> -					 " expected error; %d, errno"
> -					 ": %s and got %d",
> -					 testcase[i].exp_errno,
> -					 testcase[i].exp_errval, TEST_ERRNO);
> -			}
> -
> -		}		/*End of TEST LOOPS */
> -	}
> -
> -	/*Clean up and exit */
> -	cleanup();
> -
> -	tst_exit();
> -}				/*End of main */
> +}
> 
> -/* setup() - performs all ONE TIME setup for this test */
>  void setup(void)

missing static

>  {
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	bad_addr = tst_get_bad_addr(NULL);

Isn't the bad address unused here?

What we should do instead is to loop over the tcases array here and set
the fsname to the bad address when exp_errno is set to EFAULT.

>  }
> 
> -/*
> -* cleanup() - Performs one time cleanup for this test at
> -* completion or premature exit
> -*/
> -void cleanup(void)
> -{
> +static struct tst_test test = {
> +	.setup = setup,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = verify_sysfs05,
> +};
> 
> -}
> --
> 2.20.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
