Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3A24FC49
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 13:08:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C1973C2EF2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 13:08:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3577C3C0515
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 13:08:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 38E6C2009FB
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 13:08:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 562BAAC1D
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 11:08:45 +0000 (UTC)
Date: Mon, 24 Aug 2020 13:08:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200824110813.GA13255@dell5510>
References: <20200824102439.26587-1-pvorel@suse.cz>
 <332d88d9-7a5e-c45a-273e-61da8aaad3c6@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <332d88d9-7a5e-c45a-273e-61da8aaad3c6@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] prepare_lvm.sh: Allow to define tmp directory
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
> You should change only LVM_IMGDIR where the backing files are stored. If
> you also change LVM_TMPDIR, it'll break the lvm.local runfile.
Wouldn't be less confusing to change both directories? Updating
generate_lvm_runfile.sh is trivial (ignoring variable setup in all 3 scripts):

- sed -e "s/{fsname}/$fsname/g" "$INFILE" >>"$OUTFILE"
+ sed -e "s/{fsname}/$fsname/g; s^/tmp/ltp/^$LVM_DIR/ltp^g" "$INFILE" >>"$OUTFILE"

> Also don't forget to update cleanup_lvm.sh.
Good point, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
