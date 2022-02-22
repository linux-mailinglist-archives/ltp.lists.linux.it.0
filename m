Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2144C0035
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Feb 2022 18:33:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 859863CA1B7
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Feb 2022 18:33:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41A693C96D5
 for <ltp@lists.linux.it>; Tue, 22 Feb 2022 18:33:09 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3DCB140162A
 for <ltp@lists.linux.it>; Tue, 22 Feb 2022 18:33:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC2362113A;
 Tue, 22 Feb 2022 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645551187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pcLz4XohPVEYe+vYAnGqFkgCjcZHXdOldaMQ/ebA9ik=;
 b=voCz+qpaV/GSWbXn9jx2zIjYo8PAmEJWvQFgr5Rvz0eWDduIu4DF4e4wUdPVWo7q4RqX4w
 PSjJS2NRv4BPQIF6lb5iO71a/apbkPU7j0u+fayMjmSITbu6MKgrTYbyU6ZOYu99iwhRL2
 m1UbjwzfB1Eb6r4BlxVV8Wgx+c0KJms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645551187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pcLz4XohPVEYe+vYAnGqFkgCjcZHXdOldaMQ/ebA9ik=;
 b=P2vpwOiMKp/Wv8wxCZBbo/R3kzlUINeEPDXNfzflIe0qLNnCYWZtzf2crIshQ/BxxhqyHj
 MljSoVH7wwPi1ECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9319513A88;
 Tue, 22 Feb 2022 17:33:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kp5JIlMeFWJ/YAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 22 Feb 2022 17:33:07 +0000
Date: Tue, 22 Feb 2022 18:35:19 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Message-ID: <YhUe1yp0ukdUJs1V@yuki>
References: <20220222155514.2255913-1-nikita.yushchenko@virtuozzo.com>
 <YhUKtWP8dwNBAcmy@yuki>
 <26fe8a19-8557-5a63-7e5f-fb126e8eed95@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26fe8a19-8557-5a63-7e5f-fb126e8eed95@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] testcases/lib: introduce sysctl wrapper
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
Cc: kernel@openvz.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> LTP sometimes uses sysctl under 'tst_net_run' wrapper
> 
> Using shell redirection under wrapper is quite tricky if possible at all.

Ah, right. But I guess that adding a simple tool that would behave just
as echo but the first parameter would be filename may be cleaner
solution than wrapping around the sysctl command.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
