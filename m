Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15439BFD0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:41:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E23F23C7FE6
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 20:41:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FC9B3C27F0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:41:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C3A192010F9
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 20:41:48 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AAFE1FD4A;
 Fri,  4 Jun 2021 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622832108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MIdTrM4i83LXtqALPxutLWP62melcJyxMbOz2X+bn9U=;
 b=SPEmDlY7r5Pt062in244XwTJvQbx3qQkxn9vOmeM0MYtJ1LTo6yFzDt0OcjzYtOKvEMlFO
 TFS6kyYRNEV9XFzD1uVOfK/A470EAq4qycZ3fOapjCwieg6JRIs25Y5FT9KG65wPrv0CAB
 TpArqYBV7vZumw4UUlbU99bDwFTdgHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622832108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MIdTrM4i83LXtqALPxutLWP62melcJyxMbOz2X+bn9U=;
 b=8VGvYwWJDo383FA2QbCEXcjzeO6i22OHQDjQcLX+bSDhsV9Qb9f7/UH2IjH7VuwnlAIhoK
 CpE63/7wiUAoVtDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ECF79118DD;
 Fri,  4 Jun 2021 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622832108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MIdTrM4i83LXtqALPxutLWP62melcJyxMbOz2X+bn9U=;
 b=SPEmDlY7r5Pt062in244XwTJvQbx3qQkxn9vOmeM0MYtJ1LTo6yFzDt0OcjzYtOKvEMlFO
 TFS6kyYRNEV9XFzD1uVOfK/A470EAq4qycZ3fOapjCwieg6JRIs25Y5FT9KG65wPrv0CAB
 TpArqYBV7vZumw4UUlbU99bDwFTdgHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622832108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MIdTrM4i83LXtqALPxutLWP62melcJyxMbOz2X+bn9U=;
 b=8VGvYwWJDo383FA2QbCEXcjzeO6i22OHQDjQcLX+bSDhsV9Qb9f7/UH2IjH7VuwnlAIhoK
 CpE63/7wiUAoVtDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id AG2tOOtzumBFWwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 18:41:47 +0000
Date: Fri, 4 Jun 2021 20:15:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <YLpt386rlLDzgfCi@yuki>
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
 <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
 <YLn3BQHhZIq5vNId@pevik>
 <3F3FDAE9-7190-4046-9438-17D2BE14FCA0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F3FDAE9-7190-4046-9438-17D2BE14FCA0@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Unless there???s a real need for consolidating the LICENSE files,
> I???d leave it well enough alone in the source tree and just aggregate
> all of the licenses as an uber license and distribute it with the
> binary packages.

As far as I can tell the cleanup patch removes 22 identical copies of
GPL v2 sprinkled randomly over the tree and keeps only the top level
one, while each of the individual files still retains a copyright and a
seprarate license. As far as I can tell this is harmless.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
