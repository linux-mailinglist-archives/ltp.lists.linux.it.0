Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC421AFED
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 09:16:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D79823C5398
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 09:16:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4BB813C0ECC
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 09:16:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8718D201461
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 09:16:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48EEBAEBA;
 Fri, 10 Jul 2020 07:16:24 +0000 (UTC)
Date: Fri, 10 Jul 2020 09:16:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200710071622.GA24834@dell5510>
References: <20200701233133.122801-1-petr.vorel@gmail.com>
 <CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com>
 <2c7f1334-0ff1-7530-90fa-7f3ce796a829@linux.ibm.com>
 <CAEemH2dKAuteO=UWm=M4D4LeW4KVcLdts_AwiLRyYsdur14ESA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dKAuteO=UWm=M4D4LeW4KVcLdts_AwiLRyYsdur14ESA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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
Cc: Harish <harish@linux.ibm.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> I have pushed both patches, and remove the test8 too.

Thanks for merging all the fixes
(I was on 2 weeks vacation thus didn't reply).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
