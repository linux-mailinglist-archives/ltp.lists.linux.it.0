Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AD39708D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:48:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C88593C8048
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB2FD3C222C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:48:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E33B0600BE6
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:48:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3762E1FD3D;
 Tue,  1 Jun 2021 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540933;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMK/o4t41AHEAZlXxqMj1BHuyBb9PFW/TV4DskKQVQs=;
 b=uJ9dpnS5kzknyWuH9JDTRsKvYhFDnrb6UO80VxEv1cEGbxM94UhtaMaiBCkb4W1KuX4rvX
 +TQ6XFfemnP8RClgBrngvlwIgEDLoksRqC7dql09r1hDy1mftIkhwdE5Nov6Wdwn5u6ANV
 rRNm5Aa5iiZ6bVw5XXUSKn1RO6hF23s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540933;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMK/o4t41AHEAZlXxqMj1BHuyBb9PFW/TV4DskKQVQs=;
 b=zsBd/o+1rZnfClCKjjD8F6PcHAxJKdo43eAxwqe3cR5HD8jHdOAjZu4PkpMv9X/wFqSNN1
 IP0nS+k5OJUrOnDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1556C118DD;
 Tue,  1 Jun 2021 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540933;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMK/o4t41AHEAZlXxqMj1BHuyBb9PFW/TV4DskKQVQs=;
 b=uJ9dpnS5kzknyWuH9JDTRsKvYhFDnrb6UO80VxEv1cEGbxM94UhtaMaiBCkb4W1KuX4rvX
 +TQ6XFfemnP8RClgBrngvlwIgEDLoksRqC7dql09r1hDy1mftIkhwdE5Nov6Wdwn5u6ANV
 rRNm5Aa5iiZ6bVw5XXUSKn1RO6hF23s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540933;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMK/o4t41AHEAZlXxqMj1BHuyBb9PFW/TV4DskKQVQs=;
 b=zsBd/o+1rZnfClCKjjD8F6PcHAxJKdo43eAxwqe3cR5HD8jHdOAjZu4PkpMv9X/wFqSNN1
 IP0nS+k5OJUrOnDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Et8mBIUCtmAAdgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 09:48:53 +0000
Date: Tue, 1 Jun 2021 11:48:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLYCg+NV6g+inevh@pevik>
References: <20210601091943.6300-1-pvorel@suse.cz>
 <YLX7fpw6lSmNRdX9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLX7fpw6lSmNRdX9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] CI/debian: Install dblatex
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

> Hi!
> Things like this qualify to be obvious enough to be merged right away...

> Anyways acked.

Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
