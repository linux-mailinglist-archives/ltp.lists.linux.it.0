Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2F125CFB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 09:52:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55CBA3C2215
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 09:52:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DD2E73C149E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 09:52:04 +0100 (CET)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E67D20167E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 09:52:04 +0100 (CET)
Received: by mail-lf1-x144.google.com with SMTP id y19so3735015lfl.9
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LqnEIVtCr3wXx3w5XAg3ahO+bu3ob2lBZmjRCmpBt1s=;
 b=fAbIqlbhVrufHD0a0yxS7laEfof65NP/4W1xi45FYcf1mMHSfUNQLtnpqeUkWvc7Mm
 ncZXSEYkKsA8CSSv3OZS50qeLJivWYbXToRhP3EhmqZ/tSZ7I0Q/jAXMV1qaU82bQBuA
 RyX1z1ph6fkrMY6utTCL9jybibT1+X3EFgLUpZjHwWv1x50IiA9QuNc3dDV5KmzxOa/a
 Boh2LkuzCb/k0Tzl3Qumniv80jJZfIzY3Zy0zelGel7wss3KYHFyArLm4Zqd6vfd0PXV
 3gvPI7gJML6LLvnIAgzulyRlII3RahhGXfYD9CLD++HCwmyk60onE6XByg2ke2NbpRoQ
 yvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LqnEIVtCr3wXx3w5XAg3ahO+bu3ob2lBZmjRCmpBt1s=;
 b=aTAFjEmOk8YKu5f1U+mVaxzsiTRGSLCPSVqJ+IbXK9xUENUW8lzGEwbEz+MUt6Der7
 4kjmbg5NtgrBySbuQzsTE4WXpsZ6iY3Ifx8+JtllZuJKQjWUw+yNSa9qWe9xeu4jfIgn
 oXgzHIlVEWIa1HkK69kUVf26+WpHUZKT1ZHq3AQ7Jy7MSHhpcqWU5TlV0oxXjs5ICyFM
 9l89IVdZtw5soOcg1avGl51MrhaR8kkDHQYOFL5IbkhYzH9rIaZrydPkZ3PN+ZmjmdaW
 wtgoRz5acRNn+I1BEBo8PCAC/gUco2Ez7f3b3SYGS/vfCflRjG6/H3GcXR7L2pdWnxHM
 QDFw==
X-Gm-Message-State: APjAAAXWFhxtqwIOYqGDnXHhg0uhBQMlmLSdWMDL+MihFdB4qOlCf2Ke
 uAMXCtfqCiZ68cPsz3anOhD8JjgoNsEcNAVGvcBz3w==
X-Google-Smtp-Source: APXvYqx26HCAe+o6hQxsmT1KNzU8MHoCEdlYeW+WVgT0cOoLhfphlRg1pslK7vHc1RHlo3SAZAHoYUPU9HP2heOqtaA=
X-Received: by 2002:ac2:44d9:: with SMTP id d25mr4785427lfm.15.1576745523417; 
 Thu, 19 Dec 2019 00:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
In-Reply-To: <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 19 Dec 2019 14:21:52 +0530
Message-ID: <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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

Hi Li,

On Thu, 19 Dec 2019 at 12:40, Li Wang <liwang@redhat.com> wrote:
>
> Hi Sumit,
>
> On Wed, Dec 18, 2019 at 6:14 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> + Cyril (who originally proposed upper bound check)
>>
>> On Wed, 18 Dec 2019 at 14:55, Jan Stancek <jstancek@redhat.com> wrote:
>> >
>> >
>> > ----- Original Message -----
>> > > " The test's assumptions are fundamentally false; it thinks it can look
>> > > at IO counters (tst_dev_bytes_written) for a disk before and after a
>> > > system call, and attribute all of the IO seen to the system call that
>> > > was made - this isn't necessarily correct. Other processes may generate
>> > > IO in the background.
>> >
>> > We create our own block device, so there shouldn't be other processes
>> > writing to it.
>> >
>> > > ext4 defers a lot of IO on a freshly made filesystem to the kernel -
>> > > for example it will initialize the journal and inode tables after the
>> > > mount
>> >
>> > Journal was my guess as well.
>>
>> To avoid similar scenarios, I suggested to add a "sync()" call just
>> prior to test here [1]. And I couldn't reproduce the failure in
>> 1000-times run with 4.19 kernel.
>
>
> Yes, that makes sense to me.
>

Would you mind to give it a try and check if you could reproduce the failure?

-Sumit

>>
>>
>> Also, I think having a "sync()" call becomes more important in case we
>> remove the upper bound otherwise test might not provide reliable
>> results.
>>
>> [1] http://lists.linux.it/pipermail/ltp/2019-October/014157.html
>>
>> -Sumit
>>
>> >
>> > > Let's remove the toplimit of write back, and think as long as we synced
>> > > at least the expected amount, the test passes. The +10% limit seems
>> > > arbitrary.
>> >
>> > I think this is reasonable approach until we find better way
>> > to measure what was synced.
>> >
>> > Acked-by: Jan Stancek <jstancek@redhat.com>
>> >
>> >
>> > --
>> > Mailing list info: https://lists.linux.it/listinfo/ltp
>>
>
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
