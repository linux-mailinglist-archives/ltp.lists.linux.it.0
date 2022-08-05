Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B658A987
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 12:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C7E03C94B3
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 12:36:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F5343C182F
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 12:36:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0186610000C7
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 12:36:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B4CD208F5;
 Fri,  5 Aug 2022 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659695768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyM8XoL4eF1N+mj3+D/oPcsoyqNO+V2aRk8KTZyWy2w=;
 b=DttX0yFONfwYAiCwdeVHrmu4m7D12K3721NO7A0ht6L0i35aRDV7S1s8NfddGVc9Pzz+Iu
 GLJUCMMACwPRxwyn4XnbPxqeRaRgjPTp4WaWtj0hoO4G2/wDVEwSx0vMmoBPt5sQLApHnV
 wz8N/89hSpln6IOzRhLAdvmEHchLkeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659695768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyM8XoL4eF1N+mj3+D/oPcsoyqNO+V2aRk8KTZyWy2w=;
 b=KlB0Cdkb6rzmfPkF/F2MyVkKZaQCbTI7fdl/EvTHX9J1fvmO9SqHm+LZVf62a9bYhu6eXo
 d7uhRq2hTdLoY7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA65113A9C;
 Fri,  5 Aug 2022 10:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S1dBOJfy7GLGbQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 05 Aug 2022 10:36:07 +0000
Date: Fri, 5 Aug 2022 12:36:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YuzylnO6gyw54FY7@pevik>
References: <20220805063401.1647479-1-liwang@redhat.com>
 <20220805063401.1647479-2-liwang@redhat.com>
 <YuzDY8Lg36lCXlEe@pevik>
 <CAEemH2dKyjLw4wH+yeMXyv6QLHyTLWbxxSeHpyuUBjDiFUhFOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dKyjLw4wH+yeMXyv6QLHyTLWbxxSeHpyuUBjDiFUhFOQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lapi/pidfd: adding pidfd header file
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

...
> Thanks, but I'm not very passionate about enabling it, as we now have
> ltp quick test on fedora-rawhide internally(RedHat), but obviously that
> consumed people's energy on debugging *temporally* failure[1]. I'm still
> thinking if that's worth it.

Hi Li,

Sure, np.
Petr

> [1] some of them disappear after code-rebase or package upgrading

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
