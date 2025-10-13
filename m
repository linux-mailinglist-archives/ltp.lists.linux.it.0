Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B8BD2667
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Oct 2025 11:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1760349426; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=hJOaMoz2gB1XhdE+5QtkhRUl55D7OHzkufZuEVBZfXI=;
 b=gYNVOeU6UULhXKgQ71swWGjWuzQ9i4oGcuqlG5qV2E8b3tdufhM8dEpIYpKBJODjZWmCX
 kOmUE1cgmNQlgyzvivK076BA4aoHbYNScVCMCVeSWBPlbUFSiI/iccBg6i9PE3ecVQaaGXd
 2oSWJGvOF+A27tCdql2T66Js+vFvreo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5635B3CEB6A
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Oct 2025 11:57:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AEA0A3CE6AC
 for <ltp@lists.linux.it>; Mon, 13 Oct 2025 11:56:53 +0200 (CEST)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC012140026D
 for <ltp@lists.linux.it>; Mon, 13 Oct 2025 11:56:52 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so24028875e9.1
 for <ltp@lists.linux.it>; Mon, 13 Oct 2025 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760349412; x=1760954212; darn=lists.linux.it;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntaVYyS19jhIE7FdZ0UabR/8/3hP8WfjS9fLP717OXA=;
 b=QQ7gXZe3GcXgsN+4Uc+pw9bxIUH8AgtPeyrZjqK1JobrMXtTtCJajBANNKOnbbjyCF
 gGIkL1KrYrsZLJCchEEHPd0OMEhKfoOIO3e69BvfQ/iupLlIs16pz87VvcyO97vqc3Yz
 kYz0h2Hame1snF2Je+9vLl1Ctr5fdh+NHaJin9C3k6aEY2J15XnIBIYkQBv0vk8S6wOu
 rEKVWNttvI2Y6QXNEqJXuCDd6JZHSbcPt5lSeIx5c/+pIFVHhOQVV4l8XatF7OLcFmA0
 UllylKLfKs7Qka2taOrKe7ClNj8HySqsGNs8581CZD2iovSPhonO0lcwvexJDfRhsA/g
 6Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760349412; x=1760954212;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ntaVYyS19jhIE7FdZ0UabR/8/3hP8WfjS9fLP717OXA=;
 b=gpCxetFZejQo61jR8ffcq9W4hbTnTW0B25Q5WoXFcSzDpm/BA492pO335LDpMuok/V
 cKJ0h85EAS3cHQbH41Vom+S0ObekfOPwpHkzl/zkeMj0GUMYNU0M/aouP5snk/YfIVj6
 3+r2uF/eCazD/BK6rvhj6uMprmJRCYdd04mY3Hiz8xydsY7gE3mD3mqt77i1zBORUZo5
 ISNxPl9sZspx3+REGlnSOxPzJlVhEfT1YbRSVev4CeXbYSQBf1Uy7IiUBElcVymkv2m5
 syaUd++pkCSs4AVp6mgLwlficzFYOmXPkkwVD9mcb8U/qj6Jor2wJOqWbui5dQ/SWBd1
 7kcw==
X-Gm-Message-State: AOJu0YzL3V2HOa7fDe7izwKmk0rHEEJ7TCbS+1HhRQwNRMJELiKIAC7L
 s8zLKcVlwxCkrUqd1Vgv1+m1tZvR348x/iNUvtW1h/o8lRNJRtuqSuEeYU+afzXhDnk=
X-Gm-Gg: ASbGncu6mCpbe54DxuWosSFQ+fHHeVRgb/FAcnNyaWIwhYyUYJkxDbyzGthlrldITRA
 SVfkzULCMmfay2x/9eWyZivAr4u2mRGUQZnYL+34UmBvfPPF8epNDjX3M+3DlEyzqOkgsOZXM2s
 75TAtUdl/L3oTynV320GpN8ep2XI0GTITdmhAIeuJ6V/hF1iKLliVv5GnfU9eXSydqkgDx9zREg
 Wsax4Iub6cXIFsZpuuhoQmqHgux0FwAJn0YFkbU+fvCAZtdktS5eJI7lw8OfEnzUbEksJAOdt9F
 cyTfVJ+Yx4WtOOl/DFDa8zfCCDC3+pq25QKwt8wQnn7LsN9vy8n00thuSYmcqPdd0jsCtTTQzQN
 rGwo0ClxEc59h0VtCTAGJsfAfYe7y52sV93FCFWFzeas7qs3vnutKM4aQCxvrlt4YLPcgv9Ld/5
 ODabzkrBuCq07GaFZdokCOBmd12PXdxIFrYmdrVnmRfiSB5A==
X-Google-Smtp-Source: AGHT+IGkcgY4CahPYBXDcrGorNDpR4g8SRk81t9vuP5TCx4wDWSNDCk9LqTHb6yXvBXkWCFkJc7UrA==
X-Received: by 2002:a05:600c:1e86:b0:46e:4784:cdf5 with SMTP id
 5b1f17b1804b1-46fa9a9f254mr153515395e9.15.1760349412134; 
 Mon, 13 Oct 2025 02:56:52 -0700 (PDT)
Received: from localhost
 (p200300ef2f176d00961bd2614569b9c8.dip0.t-ipconnect.de.
 [2003:ef:2f17:6d00:961b:d261:4569:b9c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3d438fsm127418185e9.2.2025.10.13.02.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 02:56:51 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 13 Oct 2025 11:56:51 +0200
Message-Id: <DDH3SBAZQOWD.PPCDX4YW7KBZ@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, "Avinesh Kumar" <akumar@suse.de>
X-Mailer: aerc 0.21.0
References: <aOODn-CZ7F1A777o@yuki.lan>
 <20251007143207.27848-1-akumar@suse.de> <6213145.lOV4Wx5bFT@thinkpad>
 <20251007213713.GB160168@pevik>
In-Reply-To: <20251007213713.GB160168@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] openposix: update invalid clock id to
 accomodate new auxiliary clock ids
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp <ltp-bounces+andrea.cervesato=suse.com@lists.linux.it>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

On Tue Oct 7, 2025 at 11:37 PM CEST, Petr Vorel wrote:
>> On Tuesday, October 7, 2025 4:32:06 PM CEST Avinesh Kumar wrote:
>> > Starting kernel v6.17, there are 8 more auxiliary clock ids reserved on
>> > systems with CONFIG_POSIX_AUX_CLOCK=y [1] and moreover posix systems can
>> > define and support any number of clocks beyond the mandatory ones.
>
>> > [1] https://lore.kernel.org/lkml/20250519083025.905800695@linutronix.de/
>
>> > Signed-off-by: Avinesh Kumar <akumar@suse.de>
>> > ---
>> >  .../conformance/interfaces/clock_getres/6-2.c                | 5 ++---
>> >  .../conformance/interfaces/clock_gettime/8-2.c               | 4 ++--
>> >  .../conformance/interfaces/clock_settime/17-2.c              | 4 ++--
>> >  3 files changed, 6 insertions(+), 7 deletions(-)
>
>> > diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
>> > index c44809012..af45e27c9 100644
>> > --- a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
>> > +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
>> > @@ -17,8 +17,7 @@
>> >   *   unassigned value = -1073743192 (ex. of what gcc will set to)
>> >   *   unassigned value = 1073743192 (ex. of what gcc will set to)
>> >   *   -1
>> > - *   17 (currently not = to any clock)
>> > - *
>> > + *   50 (hopefully big enough value not to be a valid clock id)
>> >   */
>> >  #include <stdio.h>
>> >  #include <time.h>
>> > @@ -33,7 +32,7 @@ int main(void)
>> >  	struct timespec res;
>> >  	int invalid_tests[NUMINVALIDTESTS] = {
>> >  		INT32_MIN, INT32_MAX, 2147483647, -2147483647, -1073743192,
>> > -		1073743192, -1, 17
>> > +		1073743192, -1, 50
>> >  	};
>> >  	int i;
>> >  	int failure = 0;
>> > diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime/8-2.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime/8-2.c
>> > index ed4cd4078..92263ce87 100644
>> > --- a/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime/8-2.c
>> > +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime/8-2.c
>> > @@ -15,7 +15,7 @@
>> >   *   unassigned value = -1073743192 (ex. of what gcc will set to)
>> >   *   unassigned value = 1073743192 (ex. of what gcc will set to)
>> >   *   -1
>> > - *   17 (currently not = to any clock)
>> > +  *   50 (hopefully big enough value not to be a valid clock id)
>> I see I added extra space in this one, please fix while merging if patch is fine.
>
> Sure, np.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Kind regards,
> Petr
>
>> Thanks,
>> Avinesh

Maybe we should merge this patch, WDYT?

Acked-by: Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
