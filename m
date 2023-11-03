Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46A7DFF6B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 08:32:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 574A13CC814
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Nov 2023 08:32:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A7AB3CC802
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 08:32:50 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D142B1000A1A
 for <ltp@lists.linux.it>; Fri,  3 Nov 2023 08:32:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3C671F388;
 Fri,  3 Nov 2023 07:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698996767;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mf/+l4NEfqaeQLvm8UBgemAmFnzRoq2nTmluAO0DRrg=;
 b=AWpTB9PnqyWyYALUFOUXdplBi7Fw41JsFjVByH+J0WFZwnrIb6Swahctyhtdcqh5H8urx3
 XTPXwTfg6u287VMQN+Qyg/td1r6jdhZa6IQgbrSn17bumQEBIF2v3zAzTHquEHsGTyUInI
 WpaZlvrBDtw9RE1TFTL1Pc5LoTJfiY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698996767;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mf/+l4NEfqaeQLvm8UBgemAmFnzRoq2nTmluAO0DRrg=;
 b=krtL77f8v+1bciPYrcfiOK16Myo1jjOr+DMsp73J/Ca/0OfJcrEH7X0/4E2WWqS625WA20
 yNpkDfmGcVZmnbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 84D3B13907;
 Fri,  3 Nov 2023 07:32:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I8YxHx+iRGWGPQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 03 Nov 2023 07:32:47 +0000
Date: Fri, 3 Nov 2023 08:32:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Yang Xu (Fujitsu)" <xuyang2018.jy@fujitsu.com>
Message-ID: <20231103073246.GB998015@pevik>
References: <1697021709-22916-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <20231012095515.GA618148@pevik>
 <807b574c-35f6-c84d-91ef-229385e8009a@fujitsu.com>
 <20231013061217.GA688129@pevik> <20231025235127.GA540370@pevik>
 <OS7PR01MB11839E71D4AAEFAEB0DBC7919FDDDA@OS7PR01MB11839.jpnprd01.prod.outlook.com>
 <TYWPR01MB11829EF94773BEC2AD0A8E95FFDA0A@TYWPR01MB11829.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYWPR01MB11829EF94773BEC2AD0A8E95FFDA0A@TYWPR01MB11829.jpnprd01.prod.outlook.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] link03: Convert docs to docparse
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,
> Hi Petr,

> I've noticed that the test objectives of link03 and link05 are very similar, and the description of link05's test has no relevance to the test code.
> Therefore, I think we can simply remove link03 and update the test description of link05 to replace link03.
> As for your previous suggestions for modifying the link05 code, I don't have a good solution for this.

> The specific information is as follows:
> LINK: http://patchwork.ozlabs.org/project/ltp/patch/1697021709-22916-2-git-send-email-xuyang2018.jy@fujitsu.com/

Indeed, test would have to print ouput 1000x, because each test needs to report
result. Therefore let's keep it. I hope it makes sense to run test 1000x.

E.g. feel free to merge (ideally with fixes spaces to tags, but understand if
you do just docparse change).

Kind regards,
Petr

> Best Regards,
> Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
