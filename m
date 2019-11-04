Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E5ED8A7
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 06:40:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B99F3C2474
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 06:40:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B2E473C176C
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 06:40:49 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 11A401A00643
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 06:40:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,266,1569254400"; d="scan'208,217";a="77878562"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 13:40:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 88B5641B7076;
 Mon,  4 Nov 2019 13:32:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 4 Nov 2019 13:40:44 +0800
To: Petr Vorel <pvorel@suse.cz>, <ltp@lists.linux.it>
References: <20191101073528.GA22452@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <332232ad-3b46-332d-c917-3175ff56868d@cn.fujitsu.com>
Date: Mon, 4 Nov 2019 13:40:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191101073528.GA22452@dell5510>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 88B5641B7076.AB245
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0075954343=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0075954343==
Content-Type: multipart/alternative;
	boundary="------------7BD96FFE33301EC96BAC1837"

--------------7BD96FFE33301EC96BAC1837
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/01 15:35, Petr Vorel wrote:

> Hi,
>
> I wonder if anybody uses include/config.h.default, include/mk/config.mk.default,
> include/mk/features.mk.default. Is it their purpose for people who, for some
> reason can't run ./configure? (I wonder who'd need it) Can we just drop them?

Hi Petr

Yes. Reading LTP/INSTALL[1], these files are used when we don't use autoconf.
as below:
Using autoconf (preferred):
	$ make autotools # This must be run from "$TOP_SRCDIR"!
	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
	$ cd "$TOP_BUILDDIR" && "$TOP_SRCDIR/configure" \
	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]

Not using autoconf:

	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
	$ cp "$TOP_SRCDIR/include/config.h.default" \
	     "$TOP_BUILDDIR/include/config.h"
	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
	     "$TOP_BUILDDIR/include/mk/config.mk"
	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
	     "$TOP_BUILDDIR/include/mk/features.mk"

[1]https://github.com/linux-test-project/ltp/blob/master/INSTAL

ps:IMO, I don't use these files. Now most distributions have auotconf and we can remove these files.

Thanks
Yang Xu

>
> include/config.h.default is out of sync with include/config.h.in;
> include/mk/config.mk.default and include/mk/features.mk.default are synced.
>
> Kind regards,
> Petr
>



--------------7BD96FFE33301EC96BAC1837
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/01 15:35, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191101073528.GA22452@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi,

I wonder if anybody uses include/config.h.default, include/mk/config.mk.default,
include/mk/features.mk.default. Is it their purpose for people who, for some
reason can't run ./configure? (I wonder who'd need it) Can we just drop them?</pre>
    </blockquote>
    <pre>Hi Petr</pre>
    <pre>Yes. Reading LTP/INSTALL[1], these files are used when we don't use autoconf.
as below:
Using autoconf (preferred):
	$ make autotools # This must be run from "$TOP_SRCDIR"!
	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
	$ cd "$TOP_BUILDDIR" &amp;&amp; "$TOP_SRCDIR/configure" \
	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]

Not using autoconf:

	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
	$ cp "$TOP_SRCDIR/include/config.h.default" \
	     "$TOP_BUILDDIR/include/config.h"
	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
	     "$TOP_BUILDDIR/include/mk/config.mk"
	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
	     "$TOP_BUILDDIR/include/mk/features.mk"

</pre>
    <pre>[1]<a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/blob/master/INSTAL">https://github.com/linux-test-project/ltp/blob/master/INSTAL</a>

ps:IMO, I don't use these files. Now most distributions have auotconf and we can remove these files.

Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191101073528.GA22452@dell5510">
      <pre class="moz-quote-pre" wrap="">

include/config.h.default is out of sync with include/config.h.in;
include/mk/config.mk.default and include/mk/features.mk.default are synced.

Kind regards,
Petr

</pre>
    </blockquote>
  </body>
</html>

--------------7BD96FFE33301EC96BAC1837--

--===============0075954343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0075954343==--
