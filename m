Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 131963DB7FA
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:44:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DA323C8EF5
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:44:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B623F3C232D
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:43:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7DAC8600A36
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:43:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62B15223D0;
 Fri, 30 Jul 2021 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627645427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zl4fTABlx3HT1Gf4at/Aro6+qX9VQG76C/oRBowqw0Q=;
 b=f0ZQnB1SbF/TUGsgK2EU5HgFbe5UCTdIfCR7myEer6u7gtTBUhr2QoSCunYguWYysL3+Ip
 wCVUX0J6iLXy3VGh3daKEXMz9D48BcMx4HUhu7X0eLThJ/nW/u08njj5zzAoudt0pQQP12
 eY+cttQg4RU7ZcVhjk4mtP/vilYsiRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627645427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zl4fTABlx3HT1Gf4at/Aro6+qX9VQG76C/oRBowqw0Q=;
 b=qmMKaf5GBtdIZdN5fvc496rwHL+VgtF1mbFDogGA9kYXuTkEUqHfuM6pzl0tDiSrkZR69Q
 oy8Bvpm9LjTyr5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E2C113C13;
 Fri, 30 Jul 2021 11:43:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cNXQEvPlA2F6XwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 30 Jul 2021 11:43:47 +0000
Date: Fri, 30 Jul 2021 13:43:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YQPl9f6JYE8zlNrm@yuki>
References: <20210720101249.10118-1-aleksei.kodanev@bell-sw.com>
 <YQPCcew5Are2VrDh@yuki>
 <0c978fd5-9772-ad4e-c14e-c8b4a8344506@jv-coder.de>
 <CAEemH2d8sHSWCAst9-q6KiKfJTSULYS8-KivWHrS04mR6ZXjzQ@mail.gmail.com>
 <668aa923-dda1-b3ce-8f5e-042e3a2174f5@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <668aa923-dda1-b3ce-8f5e-042e3a2174f5@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] crypto/af_alg02: thread termination fixes
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > That should work but no precise log to indicate where goes wrong,
> > so I vote to go the loop way:).
> Does it really matter? The being stuck in the read does not seem to be 
> the failure case tested with this test. Otherwise it would TFAIL.
> Additionally the loop and "custom" timeout was only introduced at a 
> later stage of the test. Initially it relied on the default timeout 
> handling.
> If my assumption, that being stuck in the read is not the failure case 
> of this test, then your argument is invalid. Your argument would work for
> each and every line of code, that might be executed, when the timeout hits.

The top level in the test actually says that for some kernels the read()
does not return, which is a kernel bug so the test should report this
case as a failure as well and also the commit that fixes this should be
added to the tags structure.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
