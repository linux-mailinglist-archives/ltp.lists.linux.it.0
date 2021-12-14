Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C9474874
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:46:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 842CA3C8C69
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 17:46:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B29C93C013D
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:46:18 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 271F21001448
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 17:46:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A736210FE;
 Tue, 14 Dec 2021 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639500377;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h88o0M4banyuScug9IutrlIQC2acIHfUlRzOV/h5afU=;
 b=pMBL1QajM+1YkPUsT62wqIqg8iG5t9DY4Pqi3LwHMHv5wcwGulf3lFl+XQ3Zv/q+kuw+8F
 6dUPcWtNmjcoLc01l9azN9d6qXcaEQcxcFNrlKahE967D98qTVPuVcVlyw2d0CaoviGh6j
 A0o2+XZVgKeXjTbRIEyVPUxmuxe76g0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639500377;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h88o0M4banyuScug9IutrlIQC2acIHfUlRzOV/h5afU=;
 b=roQirhgMfbingum30/fvR/JD4pJmRSBTCqHKP0PVNlEjFO/FK/yrcUOt6HqATtkLvzsG9B
 KI++Ev1Sc6tmvMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6CD013A1D;
 Tue, 14 Dec 2021 16:46:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A3aDNljKuGETDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Dec 2021 16:46:16 +0000
Date: Tue, 14 Dec 2021 17:46:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YbjKV7yUJS+njaCY@pevik>
References: <20211214144309.6704-1-pvorel@suse.cz>
 <20211214144309.6704-4-pvorel@suse.cz> <YbjAOffrWpsMvinQ@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbjAOffrWpsMvinQ@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] lib: Add support for debugging
 .all_filesystems
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Li,

> Hi!
> > +| 'LTP_SINGLE_FS_TYPE'  | Testing only specified filesystem instead all
>                                          ^   ^
> 					 |   "specifies"
> 					 there should be comma or dash here

I meant "specific", i.e. Testing only specific filesystem instead all supported,
but "Testing only - specifies filesystem instead all supported" makes more
sense.

> Other than that the rest looks fine, for the patchset:
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks! Waiting for Li and others for input before merging it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
