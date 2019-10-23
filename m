Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C7E2023
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 18:06:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35DD73C2271
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 18:06:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3302E3C1C8D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 18:06:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 37C27600B7F
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 18:06:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DF7BAFE8;
 Wed, 23 Oct 2019 16:06:41 +0000 (UTC)
Date: Wed, 23 Oct 2019 18:06:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191023160640.GA17663@rei>
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
 <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
 <1270016842.8517878.1571817492480.JavaMail.zimbra@redhat.com>
 <CAEemH2f2D4PjaMaOE_ADUqg5igEi97nHBsH6A7qXtO-2KO7btg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f2D4PjaMaOE_ADUqg5igEi97nHBsH6A7qXtO-2KO7btg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
> Sorry, thanks for the reminder.
> [I copied the below code to gmail, it always lost the indent]
> 
> static void print_failure_hints(void)
> {
>         unsigned int i;
>         int hint_printed = 0;
>         const struct tst_tag *tags = tst_test->tags;
> 
>         if (!tags)
>                 return;
> 
>         for (i = 0; tags[i].name; i++) {
>                 if (!strcmp(tags[i].name, "linux-git")) {
>                         if (hint_printed != 1) {
>                                 hint_printed = 1;
>                                 print_colored("\nHINT: ");
>                                 printf("You _MAY_ be missing kernel fixes,
> see:\n\n");
>                         }
> 
>                         printf(LINUX_GIT_URL "%s\n", tags[i].value);
>                 } else if (!strcmp(tags[i].name, "CVE")) {
>                          if (hint_printed != 2) {
>                                  hint_printed = 2;
>                                  print_colored("\nHINT: ");
>                                  printf("You _MAY_ be vunerable to CVE(s),
> see:\n\n");
>                           }
> 
>                         printf(CVE_DB_URL "%s\n", tags[i].value);

This would produce intermixed CVE and linux-git lines unless the tags
are sorted correctly in the source code, I do not want to depend on the
order hence the two loops.

>                 } else {
>                         print_colored("\nERROR: ");
>                         printf("tags[%d].name should be linux-git or
> CVE\n", i);
>                         return;

I've tried to explain to pvorel already that this is a wrong place to
assert the tag names. If nothing else this piece of code will be rarely
triggered and the error would end up ignored.

I plan to assert the tag names in the docparse tool that will build the
test metadata during the LTP build, so that wrong metadata will actually
fail the LTP build.

>                 }
>         }
> }

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
