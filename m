Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101CED929
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:52:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD6503C2500
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:52:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 352EA3C2443
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:52:26 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 65EED1401111
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:52:24 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id y24so7165942plr.12
 for <ltp@lists.linux.it>; Sun, 03 Nov 2019 22:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6Lhx+mThMMFTH0IhgS5cRHMjHEo9UK5LVUR4bBPzSsw=;
 b=DgpaR18Ofxbqz3mUBh5faWbpl2UdqQun5EycUSRXCOnAb/drg7bONaX4+ig217l70s
 mVZXOYRHZY2TW8jZA/IZlVAXVycjCKoyAROQJlbZlAoJS67DoBklmxSaKYcSnrU8lgTI
 cIItGeEIEVDpGa4bJGmsQYk8TqQgdF3JTgoeqyTJeENye4bYvlZjwblsesEmKih07+pj
 K8/XjEKd3I/DIZZupSBdGCOJXKuhVDtads7wxjAcnTmaK/zNcvKrm4aSDcureufPryLF
 9cnjN50tR45rM29XqsojtFWK7e6mYauTR5sFNGvUQkRgfB4Hadq1DJfy1OTkpn6u4Zwf
 vLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6Lhx+mThMMFTH0IhgS5cRHMjHEo9UK5LVUR4bBPzSsw=;
 b=BImMSqSQ6XyXiTG09Xv225YQdo6ywXmzLUR5UCTiqa1cOF5VrOO7YaIRhlGHoAQwpI
 Yv+dlnajoI2BGeTNP5eYONIWjTSlDokXMENiaIo8pEjliR0jkW4A1+JXcyH59Xmt9Ok0
 1C0LO8oD8MkeC0OTsD0k+rUTIH2Tm2ONk4e1IfrekZohPczhnItRQMlhaxe83s1+pNJx
 kuj+gKc0piFEc0v58PpxoP5/2uoTc9uLDiiY5bEec1UWV0xCFgOr5DXEliz3w02M461/
 BDEwYUdK4dmCTwBzgcUTM+Nz8fa6ipxj3GC2rpNKKPbiYRpJfp4ysM+UCSLyxD+Bym5+
 P5xg==
X-Gm-Message-State: APjAAAU3VIdWOlbWDFwFQqE2YDMf/m5i+lbSfZcGP/etoz9gsJ1jqpT9
 j0rILkj13mPVbvWH1iSHs1o=
X-Google-Smtp-Source: APXvYqxSLd4n3OE18QdkFXVHEvqq0kj47msHhfaUgcvyjxQM4WhbW2ERqJwjls1g3257DxZoFsujJw==
X-Received: by 2002:a17:902:8506:: with SMTP id
 bj6mr10240602plb.342.1572850342665; 
 Sun, 03 Nov 2019 22:52:22 -0800 (PST)
Received: from [192.168.20.12] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id l3sm14016126pgo.74.2019.11.03.22.52.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Nov 2019 22:52:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
In-Reply-To: <20191104062340.GA9263@dell5510>
Date: Sun, 3 Nov 2019 22:52:21 -0800
Message-Id: <D2E9CFA1-F49E-4522-8EB3-77D5FAE93371@gmail.com>
References: <20191101073528.GA22452@dell5510>
 <332232ad-3b46-332d-c917-3175ff56868d@cn.fujitsu.com>
 <20191104062340.GA9263@dell5510>
To: Petr Vorel <pvorel@suse.cz>
X-Mailer: Apple Mail (2.3594.4.19)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove {config.h,config.mk,features.mk,}.default ?
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On Nov 3, 2019, at 22:23, Petr Vorel <pvorel@suse.cz> wrote:
> 
> Hi Xu,
> 
>> Yes. Reading LTP/INSTALL[1], these files are used when we don't use autoconf.
>> as below:
>> Using autoconf (preferred):
>> 	$ make autotools # This must be run from "$TOP_SRCDIR"!
>> 	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
>> 	$ cd "$TOP_BUILDDIR" && "$TOP_SRCDIR/configure" \
>> 	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]
> 
>> Not using autoconf:
> 
>> 	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
>> 	$ cp "$TOP_SRCDIR/include/config.h.default" \
>> 	     "$TOP_BUILDDIR/include/config.h"
>> 	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
>> 	     "$TOP_BUILDDIR/include/mk/config.mk"
>> 	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
>> 	     "$TOP_BUILDDIR/include/mk/features.mk"
> 
>> [1]https://github.com/linux-test-project/ltp/blob/master/INSTAL
> 
>> ps:IMO, I don't use these files. Now most distributions have auotconf and we can remove these files.
> Thanks for review, I'll send a patch to ML.

The reason for having a non-autoconf path is purely legacy now (like 6-10+ years ago). I vote for axing the support.
Thanks,
-Enji

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
