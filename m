Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74E3BF7E0
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 12:00:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3639A3C792F
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 12:00:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EAA53C6824
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 12:00:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AFAE1600F8A
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 12:00:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0565D201A5;
 Thu,  8 Jul 2021 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625738434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7NAraZu4Zn2BfLSr74G399ou3naA8fEV2COpwcZ7Gw=;
 b=f0hcpAYicTINItb87pg5mc323KhkSAYNeuGB0EvQ6zeDbf2+ZRLpk1cRvYFYupIJyANNUf
 IDrXHB3nkOIRlPRqFMzNm8BuJfs1PWYnTdajJdCziXTN9w/tmxn4xoyTnz0kXIt927hiOe
 gAZhI2YYjQvzCbvshyEf47eRUy+I8sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625738434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7NAraZu4Zn2BfLSr74G399ou3naA8fEV2COpwcZ7Gw=;
 b=eioZ8wUFZQVTuXircUB1IrTYRyT1DxfTcjUGXfCMPbwMatKC5dnhtOtFTsJVIyai2iVLJ1
 Wt3yFxSyr9UPJGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E69DA12FF7;
 Thu,  8 Jul 2021 10:00:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1poUN8HM5mClIQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 08 Jul 2021 10:00:33 +0000
Date: Thu, 8 Jul 2021 11:34:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: David Hu <xuehaohu@google.com>
Message-ID: <YObGwky3Nb6cN6R6@yuki>
References: <CAPd9Lg-feW5KF=BDUzfGnqZPYs4S4ypBemb3b=qgG2z-9YsCiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPd9Lg-feW5KF=BDUzfGnqZPYs4S4ypBemb3b=qgG2z-9YsCiw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Existing kexec tests
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I am looking existing tests that cover kexec (kexec_load and
> kexec_file_load across LTS versions , platforms, etc)
> 
> wondering if there are existing tests already ?

I do not think that we do have anything working in LTP, the main problem
here is that it has to be communicated to the test framework that these
tests will reboot the machine under test, which is not easy task.

So at this point I guess that it mostly depends on which framework you
are using and if there are kexec tests available for it.

The long term plan is to communicate such metadata in a json format from
the test to the framework in a framework independed way, which should
enable us for including all kinds of tests that need to reboot the SUT
in LTP.

Also CCying automated-testing ML.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
