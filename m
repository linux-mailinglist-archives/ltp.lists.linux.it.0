Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 186493A4434
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:39:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9954D3C8E94
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 16:39:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C407D3C307A
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:39:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D84041A019BD
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 16:39:06 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 37D9E21969;
 Fri, 11 Jun 2021 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623422346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRxfGTN88/9I+WInkuC5ovzjHH81ZsCJiHuHd+4RRis=;
 b=VNpKaBq0DilMms4KazbndopuzH9zv5GtafJEPstHeQlx+yeBmv/bCQhSroVyiGf0ZoF92n
 NO9JzN/BOgUhYQj6F8Rrqjq5reXHMf5VeXkWjkwQ9M8RS5dyB9L86I7AzhZac9JpF4yIjU
 IuX+mcl3t3cz51q+Z709oPTOqJu8Gig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623422346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRxfGTN88/9I+WInkuC5ovzjHH81ZsCJiHuHd+4RRis=;
 b=VaY1snFHNDQ8WMmvBjn2Qc3k19JzOtJTmJNrj6caSyAqOgzXeCGezXF7D5Ymd2yhogUDJT
 hwGUc4CxJW7096Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0E8C9118DD;
 Fri, 11 Jun 2021 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623422346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRxfGTN88/9I+WInkuC5ovzjHH81ZsCJiHuHd+4RRis=;
 b=VNpKaBq0DilMms4KazbndopuzH9zv5GtafJEPstHeQlx+yeBmv/bCQhSroVyiGf0ZoF92n
 NO9JzN/BOgUhYQj6F8Rrqjq5reXHMf5VeXkWjkwQ9M8RS5dyB9L86I7AzhZac9JpF4yIjU
 IuX+mcl3t3cz51q+Z709oPTOqJu8Gig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623422346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRxfGTN88/9I+WInkuC5ovzjHH81ZsCJiHuHd+4RRis=;
 b=VaY1snFHNDQ8WMmvBjn2Qc3k19JzOtJTmJNrj6caSyAqOgzXeCGezXF7D5Ymd2yhogUDJT
 hwGUc4CxJW7096Aw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id foeEOIl1w2A8fQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 14:39:05 +0000
Date: Fri, 11 Jun 2021 16:13:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMNveoyZ+SPZY+GQ@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-7-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-7-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 07/10] msgctl04: Skipped EFAULT tests for libc
 variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor whitespace adjustement, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
