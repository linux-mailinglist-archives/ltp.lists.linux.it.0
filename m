Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CD18B88D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 15:04:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6029B3C5489
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 15:04:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 437E53C0889
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 15:04:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8ABC16012B7
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 15:04:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E05DBAEF5;
 Thu, 19 Mar 2020 14:04:22 +0000 (UTC)
Date: Thu, 19 Mar 2020 23:00:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200319220006.GA29386@yuki.lan>
References: <20200318153801.3529-1-chrubis@suse.cz>
 <20200318153801.3529-6-chrubis@suse.cz>
 <CAEemH2f_Md7hkEWgLYABD+TLbDJvvR-aMfuuNqLNeyWSWK1EnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f_Md7hkEWgLYABD+TLbDJvvR-aMfuuNqLNeyWSWK1EnQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/9] syscalls/sysinfo03: Add time namespace test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +static struct tst_test test = {
> > +       .tcnt = ARRAY_SIZE(offsets),
> > +       .test = verify_sysinfo,
> > +       .needs_root = 1,
> > +       .forks_child = 1,
> > +       .needs_kconfigs = (const char *[]) {
> > +               "CONFIG_TIME_NS=y"
> >
> 
> Shouldn't end with 'NULL' in kconfig struct?
> If not that will mislead arrary_len to recognise wrong number of arrry(cnt)
> and caused segmentation fault in test.
> 
> 
> 
> > +       }
> >
> 
> A comma is required here ^, otherwise it'd be failing in the build phase.
> 
> +       .tags = (const struct tst_tag[]) {
> > +               {"linux-git", "ecc421e05bab"},
> >
> 
> Ending with '{}' in tags struct?

Of course, thanks for catching that!

I will fix these before applying, if the patchset is acked otherwise.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
