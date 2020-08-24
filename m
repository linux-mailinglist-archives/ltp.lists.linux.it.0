Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0325016D
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:48:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F31263C2F36
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 17:48:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CD8553C24E2
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:48:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 13C83600A04
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 17:48:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D9B4AF0F
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 15:48:45 +0000 (UTC)
Date: Mon, 24 Aug 2020 17:48:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200824154812.GA4330@dell5510>
References: <20200824112109.2995-1-pvorel@suse.cz>
 <648dc99d-5079-23ec-eba2-b10215ae8130@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <648dc99d-5079-23ec-eba2-b10215ae8130@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] prepare_lvm.sh: Allow to define tmp
 directory
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

Hi Martin,

...
> > -			sed -e "s/{fsname}/$fsname/g" "$INFILE" >>"$OUTFILE"
> > +			sed -e "s/{fsname}/$fsname/g; s^/tmp/ltp^$LVM_DIR/ltp^g" "$INFILE" >>"$OUTFILE"

> If you want to change the path in the runfile instead, it'd be cleaner
> to use a placeholder like {tempdir}. Otherwise:
That makes sense, changed that way and merged with your ack.
Thanks a lot for review and comments.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
