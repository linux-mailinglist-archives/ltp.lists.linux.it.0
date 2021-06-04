Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87139BA41
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:51:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E9113C7FCE
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:51:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18D083C4EEB
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:51:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8CB97601074
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:51:00 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D258B21A07;
 Fri,  4 Jun 2021 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622814659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGhum6NKTdYS90RvTemg/1+348cRPQ/WxZgkcN0MFFo=;
 b=pDUD54UoBAzYpQ5pYV0ozb8G1nHr8Hc8LAMjuXEkqJjXqRpXCxsMTIh7QTdVVkO50jwG6/
 cXgjIjBU2lqbvcHlNCGviSzHkzpLRrHq9HngWiadaSn6z4GZCtYm7ObJsO48y1q4of6Voz
 9LzZIFck4cv+KqU+0Wy2+dQNH4UgiE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622814659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGhum6NKTdYS90RvTemg/1+348cRPQ/WxZgkcN0MFFo=;
 b=Llp3PUxXIW2O9v1C8cBx2a5nKO7zhGJDG6Ag4pFayKY4D4ypeVl2nW4x7gBsfF5hanyJP+
 1/rvLWZ+RPihHEBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B695B118DD;
 Fri,  4 Jun 2021 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622814659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGhum6NKTdYS90RvTemg/1+348cRPQ/WxZgkcN0MFFo=;
 b=pDUD54UoBAzYpQ5pYV0ozb8G1nHr8Hc8LAMjuXEkqJjXqRpXCxsMTIh7QTdVVkO50jwG6/
 cXgjIjBU2lqbvcHlNCGviSzHkzpLRrHq9HngWiadaSn6z4GZCtYm7ObJsO48y1q4of6Voz
 9LzZIFck4cv+KqU+0Wy2+dQNH4UgiE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622814659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGhum6NKTdYS90RvTemg/1+348cRPQ/WxZgkcN0MFFo=;
 b=Llp3PUxXIW2O9v1C8cBx2a5nKO7zhGJDG6Ag4pFayKY4D4ypeVl2nW4x7gBsfF5hanyJP+
 1/rvLWZ+RPihHEBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vD5ZK8MvumD1YQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 13:50:59 +0000
Date: Fri, 4 Jun 2021 15:25:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YLoptt2bvJusW2Hh@yuki>
References: <20210604134136.6629-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604134136.6629-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] API/CGroups: Remove TEST macro use from library
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Huh, this is subset of the pach in the RFC I'm just started to look at.

I guess that we can apply the RFC patch "Add scripts to remove TEST in
library" or do you want to send split into several pieces?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
