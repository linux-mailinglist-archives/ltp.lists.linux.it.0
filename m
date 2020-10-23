Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9160296A2F
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:19:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 898923C3181
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:19:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E21F33C23C7
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:19:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 99D5C1A00A26
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:19:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E68DBACC4;
 Fri, 23 Oct 2020 07:19:40 +0000 (UTC)
Date: Fri, 23 Oct 2020 09:19:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201023071939.GB2310@x230>
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-12-chrubis@suse.cz>
 <CAEemH2cE64fq2Qn1AEuLQN5aBWv7MRykEpc5Bw=_4H5N1ZJYkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cE64fq2Qn1AEuLQN5aBWv7MRykEpc5Bw=_4H5N1ZJYkw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 11/11] docparse: Generate html and pdf using
 asciidoc{, tor}
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

Hi,

> Cyril Hrubis <chrubis@suse.cz> wrote:

> > +
> > +CLEAN_TARGETS          := *.txt

> I guess the generated  *.css *.js files should be deleted as well.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
