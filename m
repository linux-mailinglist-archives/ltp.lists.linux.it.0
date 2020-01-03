Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1412FCF3
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 20:24:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9EC53C2457
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 20:24:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A4E7D3C20D7
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 20:24:04 +0100 (CET)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA00C1400432
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 20:24:03 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id z22so40045465ljg.1
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 11:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFXcXk/rWc+vZDd2lXOSRdfqK7Rx+9AcujMvsOnCZcQ=;
 b=H1MIzm6Oi4jSBscmLV49r9Nd5HT6nc6bvrco9VvwbKlzMSopWLEIAGe6hSQb7cvv9P
 cip/Cxk8S5U7lhfpRoBFf8HeyyrOu6N9/Nrl1mnD3DgILx8h5/RFBbeGmAVeWDKR8rbY
 hm/i7+uHQDHv5J8iclqo1WiLmqKxGLcnr6544=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFXcXk/rWc+vZDd2lXOSRdfqK7Rx+9AcujMvsOnCZcQ=;
 b=Gb/LAuESOt2K2KaaNwGYEEI3LKFJJGOseDF7tY3Rd6XO1KR/3dPsU8/8xZP3XcuYQK
 3EcWzqT0o4lcUWZD42Jdb7GblscGUEXlGR06kdYSoViBYrTPk978IvqqQWsZOCAAAsyU
 2iqV44Qn+IKTh13njJdREWr1Hol86b7jcYPbXbPC341uIfHX196BJN3F6qAFHDhl8stL
 fsejFQoumJ1y1TdMwi2X0m4p+8wpv4l8cUi0btUq+iNq3FAHROiD0MVlGRmSOLeYwwy0
 UhjXf+++JEKJ82xdR6Ti39ItUCbMQPxrUDaH/ZAD73o4yqeomNQoAveSCloacZixW+WM
 GZsg==
X-Gm-Message-State: APjAAAVwGUCjJSQL/5SB4MKUcC5C2T7ETbPsF/+Q+lXKUQxHhP54exy5
 6/C94f8V5RJNiHSl+jOs7nfuLFvPvfs=
X-Google-Smtp-Source: APXvYqxqhBti9tFxEAbiJu3ZiMaoxPS+dAUyobRuhiqNCh4/pxRQsiwQ/boT3TnCJfilDGTU2+a5Lg==
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr37939174ljj.129.1578079442571; 
 Fri, 03 Jan 2020 11:24:02 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id d9sm24917301lja.73.2020.01.03.11.24.00
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 11:24:01 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 9so32514869lfq.10
 for <ltp@lists.linux.it>; Fri, 03 Jan 2020 11:24:00 -0800 (PST)
X-Received: by 2002:ac2:465e:: with SMTP id s30mr51941142lfo.134.1578079440587; 
 Fri, 03 Jan 2020 11:24:00 -0800 (PST)
MIME-Version: 1.0
References: <20200102215829.911231638@linuxfoundation.org>
 <CA+G9fYuPkOGKbeQ0FKKx4H0Bs-nRHALsFtwyRw0Rt5DoOCvRHg@mail.gmail.com>
 <CAK8P3a1+Srey_7cUd0xfaO8HdMv5tkUcs6DeDXzcUKkUD-DnGQ@mail.gmail.com>
 <CAK8P3a24EkUXTu-K2c-5B3w-LZwY7zNcX0dZixb3gd59vRw_Kw@mail.gmail.com>
 <20200103154518.GB1064304@kroah.com>
 <CAK8P3a00SpVfSE5oL8_F_8jHdg_8A5fyEKH_DWNyPToxack=zA@mail.gmail.com>
 <a2fc8b36-c512-b6dd-7349-dfb551e348b6@oracle.com>
 <8283b231-f6e8-876f-7094-d3265096ab9a@oracle.com>
 <CAHk-=wjvWTFn=C3mT5wA=mtOwXw44U+OHLVxk5DCe4v+7nOvKg@mail.gmail.com>
 <c5c3b8c8-1dfe-2433-630c-06dbfb3d318b@mageia.org>
In-Reply-To: <c5c3b8c8-1dfe-2433-630c-06dbfb3d318b@mageia.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Jan 2020 11:23:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgV_YN9az2XBX=xr_DGQiUEqwjtMXkmj-w12j58NQxneQ@mail.gmail.com>
Message-ID: <CAHk-=wgV_YN9az2XBX=xr_DGQiUEqwjtMXkmj-w12j58NQxneQ@mail.gmail.com>
To: Thomas Backlund <tmb@mageia.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.4 000/191] 5.4.8-stable review
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
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, Chengguang Xu <cgxu519@mykernel.net>,
 John Stultz <john.stultz@linaro.org>, linux- stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 3, 2020 at 11:11 AM Thomas Backlund <tmb@mageia.org> wrote:
>
> Does not seem to exist in public git yet, maybe you forgot to push ?

Not "forgot", but I've pulled a couple of other things, and done my
usual build tests etc. I tend batch up the pulls and pushes a bit,
sorry for not making that clear.

But I've pushed it all out now.

           Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
