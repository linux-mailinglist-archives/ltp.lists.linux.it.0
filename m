Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE89398E48
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2C973C5AAF
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:18:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 528E73C54D7
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C3BA01400445
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 220E322C9C;
 Wed,  2 Jun 2021 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCIZJLSBJCv2rvN4WuN+/UnNTgBZDhNIsMLBEbrkxYA=;
 b=nwpxIYZYopJ1KjEb832kWqIRzUFAxLXbvdKfZcNdSjhVWIjfvvlopDGc80GyyaknIN6ZvI
 on2DFAsyXGG3DoIseLiHXp610MctQ3hjDAXNVEEsTTNNLbk9b8QgRD9coQt9YtFa7GS5Hl
 39N3niKLJhCsPp+Aq04mDekMdg2kgL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCIZJLSBJCv2rvN4WuN+/UnNTgBZDhNIsMLBEbrkxYA=;
 b=8Rzd5Rtr7FTUkiN2nQMcJ1Bm8IZFGVVnWmeDSA5lwM3GF4xcr5EGApHkkDMo0N8bEX3TBS
 +oqATmKuDK5RnBDg==
Received: by imap.suse.de (Postfix, from userid 51)
 id 1A79911CDC; Wed,  2 Jun 2021 15:28:32 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4E22711DBA;
 Wed,  2 Jun 2021 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622631856;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCIZJLSBJCv2rvN4WuN+/UnNTgBZDhNIsMLBEbrkxYA=;
 b=Jj0FeTH4uMrfNPsRggxrXo/PBDgvhk9Ct5KNsrIGJOROGPl5TLhguY2s1dqdyGFFtdBuRt
 vIXU1T4j8R2l9o6gDdaYyz6VCq4pHXOlT+CTqbKUwbfqSlugtZ4fahPA46vITxp0evxuSJ
 wyajTepCQKRL3sBOq6ZL3heYPkhQmdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622631856;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCIZJLSBJCv2rvN4WuN+/UnNTgBZDhNIsMLBEbrkxYA=;
 b=DsY9+gV1nQdByp8DYLx67iJ8kj4zKscJVwXPs3XqeqZ/zS84bmnqSMXIAxN9pYZwF6RIaw
 C1usF7YLI5hm9DBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3WFfEbBlt2AnZAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 02 Jun 2021 11:04:16 +0000
Date: Wed, 2 Jun 2021 13:04:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YLdlrnMj6FmyAWCV@pevik>
References: <20210526172503.18621-1-pvorel@suse.cz>
 <20210526172503.18621-3-pvorel@suse.cz>
 <02781c77-9fed-b111-c3ad-3043a6e0ca29@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02781c77-9fed-b111-c3ad-3043a6e0ca29@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH v2 3/3] nfs_lib.sh: Check running rpc.mountd,
 rpc.statd
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
Cc: linux-nfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> > -TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
> > +TST_NEEDS_CMDS="$TST_NEEDS_CMDS exportfs mount"

> Does it change anything?

Just sort alphabetically (not a problem here, but in longer list it's easier to
read).

> The rest looks good.
Thx!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
