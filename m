Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1746F1550
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 12:24:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE2323CBA24
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 12:24:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 419293C08CE
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 12:24:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5801A1A00706
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 12:24:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70C0121C69;
 Fri, 28 Apr 2023 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682677476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9SK3FiitLGNpkdsLnpeSkpROtukVmIkx3DplzL+sBY=;
 b=Bir7D7EqiZh9gTaAA+/M0OZ6VYE9wRJTQDnRmTGpv1F+Jn3ZKwS+XADjJUDdQSE2LQdYXo
 Wl0tqSNKYXbbh0rxXWAJRmnyNQiGKiXtgiP7HlWynzITrArtnEPWFWZPXiqanERdjZl517
 lNUgHFo/0BgkBjEA/VIPiWTP6hcY+I8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682677476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9SK3FiitLGNpkdsLnpeSkpROtukVmIkx3DplzL+sBY=;
 b=x7F5C+rUgxiybKPWRqh0ps4HhUgZ98IVth4OnIqhty+w2MCp7hUDzw/VcivD4TuPypEVKu
 TmX/+879S5TB8HAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 592121390E;
 Fri, 28 Apr 2023 10:24:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PdRuFOSeS2TnNgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 28 Apr 2023 10:24:36 +0000
Date: Fri, 28 Apr 2023 12:25:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <ZEufJa+TyZdY9gsq@yuki>
References: <20230428084922.9834-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428084922.9834-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_cgroup: Avoid mixing mounts V1 and V2
 simultaneously
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
> There is a tiny problem with the test logic of this tst_cgroup library,
> that it potentially mixes Cgroup V1 and V2 together to be mounted at
> the same time. The scenario happens once people just requests CTRL_BASE
> (or a V2 controller not enabled) on a only V1-mounted system.
>
> Cgroup community always objected to enabling Cgroup like that (V1&V2),
> which may bring unexpected issues along the way.
> 
> So this patch cancels LTP mount V1&V2 simultaneously even if there is
> no overlap in specific controller files.

Isn't this the point of the library, to be able to use mixed V1 and V2
setup? As far as I understand it the only limitation is that we can bind
a controllter to either V1 or V2 but not both.

Also as far as I can tell, there is pleny of distributions out there at
the moment where the default is split between V1 and V2 both mounted at
the same time.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
