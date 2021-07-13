Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D336D3C7041
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:20:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D3FD3C8773
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:20:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A03043C2A73
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:20:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C91F1200B03
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:20:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D31422681;
 Tue, 13 Jul 2021 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626178853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EUWRVJPFHeS05y1XBjr5FS9ZnbOzJ9CT5R+CNpJW9iI=;
 b=GCbPG/MTzt8IJTzXDtATask0AdJ/wG9BCsA3SHo8O215XxLTg6naGSHe1pOhFAX7gKGgry
 Mk44f2jvG6ZnxvJQca8dBYO1qf3iMWuXTLigVbffoWfLZhEQR78SqGSqSoMfWOrV+mNMvW
 okeYXrUWeieW6aJenBztQYukblYECek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626178853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EUWRVJPFHeS05y1XBjr5FS9ZnbOzJ9CT5R+CNpJW9iI=;
 b=zZPJcUgKYWoMxI5NllbdTw/sX8n0FuJgBoxnZue2k0D/rW6nb3AyHkqwI+DY9zz0JFIggt
 nTZcIgNfPA6UEPCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BE5013AEE;
 Tue, 13 Jul 2021 12:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gJpQAiWF7WACAgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Jul 2021 12:20:53 +0000
Date: Tue, 13 Jul 2021 13:55:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YO1/J2pTbSsX2dGb@yuki>
References: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c05b592-e474-6a3e-2dc1-ec075a0bc558@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Failing test on failing shell commands
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I have a failing memcg_use_hierarchy_test (in
> testcases/kernel/controllers/memcg/functional/) which hits unexpected
> OOM on one of earlier commands, already in the test:
> 
>  18         echo 1 > memory.use_hierarchy
>  19         echo $PAGESIZE > memory.limit_in_bytes
>  20 
>  21         mkdir subgroup  
> mkdir: cannot create directory ???subgroup???: Cannot allocate memory
> /home/ubuntu/ltp-install/testcases/bin/memcg_use_hierarchy_test.sh: 22: cd: can't cd to subgroup
> 
> The command did not fail, as there is no "set -e" and test fails later.
> However there could be a case where such failure does not trigger later
> issue and test is a false-positive.
> 
> What is the practice for LTP shell tests to handle kind of preparation
> commands? Maybe this should be something like:

We do have ROD (as a shorthand for "run or die") in the shell test
library, so this really should be:

	ROD mkdir subgroup

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
