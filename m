Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E2D7053
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 09:42:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC6BA3C224E
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 09:42:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2C73D3C220A
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 09:42:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4EEDF600BF5
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 09:42:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21193B47B
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 07:42:22 +0000 (UTC)
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-2-chrubis@suse.cz>
 <CAEemH2e+xD2OCFZs14ejmppKu2rLXKsr16Vfc3tqw-YoesWuJg@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <CAEemH2e+xD2OCFZs14ejmppKu2rLXKsr16Vfc3tqw-YoesWuJg@mail.gmail.com>
Date: Tue, 15 Oct 2019 09:42:21 +0200
Message-ID: <87tv8awj36.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add support for test tags
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

>>  }
>>
>> +static void print_colored(const char *str)
>> +{
>> +       if (tst_color_enabled(STDOUT_FILENO))
>> +               printf("%s%s%s", ANSI_COLOR_YELLOW, str, ANSI_COLOR_RESET);
>> +       else
>> +               printf("%s", str);
>> +}
>> +
>> +static void print_failure_hints(void)
>> +{
>> +       unsigned int i;
>> +       const struct tst_tag *tags = tst_test->tags;
>> +
>> +       if (!tags)
>> +               return;
>> +
>> +       for (i = 0; tags[i].name; i++) {
>> +               if (!strcmp(tags[i].name, "linux-git")) {
>> +                       printf("\n");
>> +                       print_colored("HINT: ");
>
> +                       printf("This is a regression test for linux kernel,
>> see commit:\n\n"

It may be better just to print "Associated Linux kernel commit: ..." and
"Associated bug ID: CVE-..." in the loop. Then we can avoid any
discussions about what type of test it is.

Also, a test description tag could be added if necessary.

Maybe it would also be a good idea to link back to the test source code
on github? Possibly this info could be injected at build time?

>> +                              LINUX_GIT_URL "%s\n", tags[i].value);
>>
>
> This sentence 'HINT: This is a ...' will be printed many times if there are
> many commits in tags, I prefer to see only once in front of these
> linux-kernel links.
>
>
>> +               }
>> +
>> +               if (!strcmp(tags[i].name, "CVE")) {
>> +                       printf("\n");
>> +                       print_colored("HINT: ");
>> +                       printf("This test also tests for CVE-%s, see:\n\n"
>> +                              CVE_DB_URL "%s\n", tags[i].value,
>> tags[i].value);
>>
>
> Here as well.
>
> -- 
> Regards,
> Li Wang


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
