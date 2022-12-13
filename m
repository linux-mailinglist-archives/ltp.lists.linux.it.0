Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10164BC94
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Dec 2022 20:00:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99D583CBDB5
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Dec 2022 20:00:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA8283CBD88
 for <ltp@lists.linux.it>; Tue, 13 Dec 2022 20:00:11 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BEB45600847
 for <ltp@lists.linux.it>; Tue, 13 Dec 2022 20:00:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE2611FDB4;
 Tue, 13 Dec 2022 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670958009;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1KYkJdaedasIoTnzyrf2bTKCIwmq/NJJFHui3ihnSI=;
 b=l0It7Jym1cjnFbEkifmcxDto3Nk38tHdBLR4ymBvgYJnCKsbASaGdrUJ0eEMkaLIa2/adK
 4y5Ot2WfxfEmWsBZoPLQp5BFb40tDscewb7rW7Zb2l2eQAUn+BTTx+nRJPxrpg7cIojtGN
 OBtge1nahwKqdgkeRZxeuUciorxzux8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670958009;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1KYkJdaedasIoTnzyrf2bTKCIwmq/NJJFHui3ihnSI=;
 b=M7xke1VvXBeq8jN8FXmpaAESTtKLupsUsQ0zRLCMt8M4fOMuav6smMjgbjF8BpnuiqGgor
 whHOH7jaLrhec+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85EC1138F9;
 Tue, 13 Dec 2022 19:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8T14HLnLmGPuAwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Dec 2022 19:00:09 +0000
Date: Tue, 13 Dec 2022 20:00:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Teo Couprie Diaz <teo.coupriediaz@arm.com>
Message-ID: <Y5jLt3e3xODIcj8d@pevik>
References: <20221207092428.11798-1-teo.coupriediaz@arm.com>
 <871qp4u02j.fsf@suse.de> <Y5dHRcLD1359Rm3o@pevik>
 <4b38f13f-a8a1-bbde-9103-9900f0cf5a88@arm.com>
 <Y5eA7WeAV4b/Cp8d@pevik>
 <a2f0fa00-f14f-e394-c5cb-f2916cdc1271@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2f0fa00-f14f-e394-c5cb-f2916cdc1271@arm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/brk: add direct syscall tst_variant
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

Hi Teo,

...
> > Looking on extra brk() support detection, you must have tested it on Alpine.
> > What am I missing?
> That is quite strange indeed. As Richard pointed out in his reply to this
> message, those warnings should not happen anymore since my patch that
> changed tst_syscall to use intptr_t. ( e5d2a05a90e5 : regen.sh: Use intptr_t
> for tst_syscall return )
> However, I believe that the relevant header is only regenerated when running
> ./configure , not when building normally. I know that I forgot to do it a
> few times myself while testing the change to tst_syscall !
> To be sure that it is supposed to work, I did the following on an Alpine VM
> I used for testing :

> make clean
> make autotools
> ./configure

I'm sorry to forget basic LTP things. Setup was really old, thus rerunning
configure was needed.
No more objections from my side, merged with changes I previously posted
(to keep checks happy).

Thank you!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
