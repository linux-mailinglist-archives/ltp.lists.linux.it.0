Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4530458C44
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 11:31:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92FF93C8CB9
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 11:31:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B68733C104D
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 11:31:20 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D4B761000DD0
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 11:31:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0C041FD26;
 Mon, 22 Nov 2021 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637577078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCf2a9K4GJ/GfDjNQFqBJ0Chcv8iqkMCkHEJOvVRZgI=;
 b=Gfz3HlyXEqdGufGMaHfY7CzrdORW3Ueu++BwRchPEqGVH32qrL61SgFoykx9ttZAFGZ8aT
 sPAfexQlQX5uac4Pcdecc93iLv3Mw8v1vNJ5G8RptSgLlARU/Y5rQ2nHFfZqOUCqXltJh3
 FpMPUCLvQhghlu3zmwzvoEtv+A8so4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637577078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCf2a9K4GJ/GfDjNQFqBJ0Chcv8iqkMCkHEJOvVRZgI=;
 b=G94ylaa210EIAlDi6sOHy770ggkCKvRyce8UmtwIBlcNSs9S1BLLyOJc2/53/d51CjhKrJ
 xn5w3CSzKIIMyGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC22113B9E;
 Mon, 22 Nov 2021 10:31:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DZpmMXZxm2HFdwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 22 Nov 2021 10:31:18 +0000
Date: Mon, 22 Nov 2021 11:32:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YZtxt8oyTC8wSjMk@yuki>
References: <20211122072601.4096577-1-lkml@jv-coder.de> <YZtlxQZn06aplsvw@yuki>
 <107071aa-80e3-1cb5-ec50-f5a2a83027c1@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <107071aa-80e3-1cb5-ec50-f5a2a83027c1@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] posix/conformance/interfaces/fork/7-1: Fix
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Other than these two the changes looks good to me. If you agreen I can
> > fix the two small issues before pushing it to the repo.
> Perfect, thanks

Did that and also fixed trailing whitespace introduced in the
posixtest.h and pushed the patches, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
