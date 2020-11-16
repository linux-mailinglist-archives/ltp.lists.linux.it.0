Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A062B3D25
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:30:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 497343C2F6A
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:30:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 73ED13C2E4B
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 07:30:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1036B140076B
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 07:30:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DAAEAC1F;
 Mon, 16 Nov 2020 06:30:55 +0000 (UTC)
Date: Mon, 16 Nov 2020 07:30:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201116063053.GA68300@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201112131139.GA4962@pevik> <20201113170652.GA29443@pevik>
 <CAEemH2f0UntruTFqPZDxbU=zLsQdFLmKFqtseVhTWWqq175EZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f0UntruTFqPZDxbU=zLsQdFLmKFqtseVhTWWqq175EZg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] Test metadata extraction
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Hi Petr,

> On Sat, Nov 14, 2020 at 1:07 AM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Li,

> > ...
> > > Anybody against pushing whole patchset [1] with fix below for third
> > commit
> > > ("docparse: Add test documentation parser").

> > Going to merge whole patchset with diff below
> > (https://github.com/pevik/ltp/commits/test-metadata-extraction.v2.fixes).

> > Can I add you Reviewed-by: tag to whole patchset or a subset?


> For the whole patchset:
> Reviewed-by: Li Wang <liwang@redhat.com>
Thanks a lot, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
