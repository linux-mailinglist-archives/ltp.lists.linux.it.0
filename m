Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3176BB102
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 13:24:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47D3C3CB7B9
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 13:24:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 93DDF3CD496
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 13:24:01 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1473E600285
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 13:24:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 674551FD76;
 Wed, 15 Mar 2023 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678883040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbdCVMVVcSDO1Lhkhbv7kLaZ8pFV6BTG/UNib5btq9M=;
 b=bC1ynDYRTNL1eTo+fqqptvdtCQhRteyuWQv6iaEwZ/7PfRTdrFn+itpukgHjNHbUXZHl65
 DKVRXgbyJH8DwVcKsxRHcP3j4jscflLx8Rr+cvw++1CXiJFrMIL2e5uR1KLvrSyFEe+NRI
 g65llEvSAKWY+PUmy1zNgcdRm04fblE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678883040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbdCVMVVcSDO1Lhkhbv7kLaZ8pFV6BTG/UNib5btq9M=;
 b=aICvWKnJZGDwE7JCn9lsKRUe5wEsvkCFe2MdY6pony+6C+yeQBD/VTZB5IR1FPEq/zmsd1
 qUAE/1N2oU5e58Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2480E13A2F;
 Wed, 15 Mar 2023 12:24:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X8mqBuC4EWSVBwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Mar 2023 12:24:00 +0000
Date: Wed, 15 Mar 2023 13:23:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230315122358.GB9861@pevik>
References: <20230307145517.1359-1-pvorel@suse.cz>
 <20230307145517.1359-3-pvorel@suse.cz> <ZA81c11hvBu4xlsd@yuki>
 <9e05fdea-94f5-c7a2-6bd2-3107f0410e17@redhat.com>
 <20230313153009.GA10305@pevik> <20230313153309.GC10305@pevik>
 <20230313161240.GA11394@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313161240.GA11394@frogsfrogsfrogs>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] df01.sh: Use tst_fsfreeze for XFS on kernel
 >= 5.19
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
Cc: Eric Sandeen <sandeen@redhat.com>, Eric Sandeen <sandeen@sandeen.net>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

FYI merged without kernel specific check.
Thanks all for your input.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
