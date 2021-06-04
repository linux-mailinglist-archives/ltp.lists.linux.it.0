Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6D39B319
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:50:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7F243C53D9
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:50:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C317D3C2836
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:50:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 31EAC1401120
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:50:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 345F41FD30;
 Fri,  4 Jun 2021 06:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622789410;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS2LswTi08iig2I6z2w0NaVXzuk5Z5KLZSJK+9b3Umk=;
 b=JiiR7H6f50Ycwc6mheqdBt5/CVPWZ2A4562YEk7iI4/pBbPcKTHilo1OEHBB+9GO2ofIk3
 v3oxquSkc1SuxRcedewUfcnvIvz9L1NOeAW5blyMTpCjkrfjmNECf0V2kHCWnNj/a6TtmO
 DzF6XVCI3K/fZGBIbgVS0Njfse8UPG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622789410;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS2LswTi08iig2I6z2w0NaVXzuk5Z5KLZSJK+9b3Umk=;
 b=Pv25awTWIV5F60yC7NvTzMUWGpPBQYHAWOgY88UrADBHDfD2FzwpMiPysLc3wAotuSURr/
 Eb/nt66msVo/AFBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ED0E8118DD;
 Fri,  4 Jun 2021 06:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622789410;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS2LswTi08iig2I6z2w0NaVXzuk5Z5KLZSJK+9b3Umk=;
 b=JiiR7H6f50Ycwc6mheqdBt5/CVPWZ2A4562YEk7iI4/pBbPcKTHilo1OEHBB+9GO2ofIk3
 v3oxquSkc1SuxRcedewUfcnvIvz9L1NOeAW5blyMTpCjkrfjmNECf0V2kHCWnNj/a6TtmO
 DzF6XVCI3K/fZGBIbgVS0Njfse8UPG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622789410;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XS2LswTi08iig2I6z2w0NaVXzuk5Z5KLZSJK+9b3Umk=;
 b=Pv25awTWIV5F60yC7NvTzMUWGpPBQYHAWOgY88UrADBHDfD2FzwpMiPysLc3wAotuSURr/
 Eb/nt66msVo/AFBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id LdFdOCHNuWAfLQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 06:50:09 +0000
Date: Fri, 4 Jun 2021 08:50:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YLnNIHcZZEwT0CeM@pevik>
References: <d87da351dd8cd8c8e51afc8922162e84@sslemail.net>
 <60B8A96C.8080503@fujitsu.com>
 <befea6726fc7467b9410db3e3b961f3e@inspur.com>
 <60B98598.7000905@fujitsu.com>
 <eddbe134055240cb8889b4df76404c1d@inspur.com>
 <60B9A3D1.1040001@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60B9A3D1.1040001@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06ICBbUEFUQ0hdIGx0cC1haW9kaW8v?=
 =?utf-8?q?dio=5Fappend=3A_fix_dio=5Fappend=28=29?=
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: =?utf-8?B?IkphbWVzIERvbmcgKOiRo+S4luaxnyki?= <dongshijiang@inspur.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu, Dong,

> Hi Dong

> > Hi xuyang

> > Thank you very much for your reply, but I think we should add the judgment of the return value in the "dio_append" function, because the final return value is 0 regardless of whether the test item passes or not, and 0 means PASS.
> IMO, I don't like perror or printf function and use return value to tell
> runltp that this case failed. LTP has tst_res() function with different
> flag and ltp new test framework can check pass/fail/conf number in
> lib/tst_test.c do_exit function.

+1

> A generic fix shound use tst_resm(TFAIL,) and tst_exit function.
> --- a/testcases/kernel/io/ltp-aiodio/dio_append.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
> @@ -85,7 +85,7 @@ void dio_append(char *filename)
>         fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);

>         if (fd < 0) {
> -               perror("cannot create file");
> +               tst_resm(TFAIL, "cannot create file %s", filename);
>                 return;
>         }

> @@ -99,7 +99,7 @@ void dio_append(char *filename)
>         memset(bufptr, 0, 64 * 1024);
>         for (i = 0; i < 1000; i++) {
>                 if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
> -                       fprintf(stderr, "write %d returned %d\n", i, w);
> +                       tst_resm(TFAIL, "write %d returned %d", i, w);
>                 }
>         }
>  }
> @@ -139,5 +139,5 @@ int main(void)
>         for (i = 0; i < num_children; i++) {
>                 kill(pid[i], SIGTERM);
>         }
> -       return 0;
> +       tst_exit();
>  }

> It also need sto use setup and cleanup function. But it is old test api.
> I guess we can use new api to do it.

> @Cyril, Petr, Li
> I think it is time to convert the whole ltp-aiodio cases into new api
+1. Although these tests fail on mainline, thus it's a question how to fix them.
Also they might are already covered in xfstests [1], it'd be better to ask in
fstests ML [2].

> and we still can use ltp-aiodio.sh.
If we decide to keep aiodio, it might be worth to tranform this somehow into
runltp-ng [3].

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/
[2] https://lore.kernel.org/fstests/
[3] https://github.com/metan-ucw/runltp-ng

> Best Regards
> Yang Xu

...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
