Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E013175368
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 06:41:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D97A23C67B1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 06:41:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 36C5C3C67A6
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 06:41:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id BAB81200B23
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 06:41:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,506,1574092800"; d="scan'208";a="85423178"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Mar 2020 13:41:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2839950A9978;
 Mon,  2 Mar 2020 13:31:33 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 2 Mar 2020 13:41:24 +0800
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <MAXPR0101MB14681590CE13BB4E2ED97CFEEEE80@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <20200228092107.GB31181@rei>
 <MAXPR0101MB1468032C8109347B258800B7EEE70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <42474632-110d-bf91-f9da-37b16f8e6fed@cn.fujitsu.com>
Date: Mon, 2 Mar 2020 13:41:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB1468032C8109347B258800B7EEE70@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2839950A9978.AB587
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] netns_netlink test failure
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi

> Hi,
> What could be the possible reason behind failing,any guess??
At lease, you should attach this command output.
# ip tuntap add dev dummy0 mode tap

Best Regards
Yang Xu
> ------------------------------------------------------------------------
> *From:* Cyril Hrubis <chrubis@suse.cz>
> *Sent:* Friday, February 28, 2020 2:51 PM
> *To:* Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
> *Cc:* ltp@lists.linux.it <ltp@lists.linux.it>
> *Subject:* Re: [LTP] netns_netlink test failure
> Hi!
>> <<<test_output>>>
>> open: No such file or directory
>> netns_netlink=A0=A0=A0 1=A0 TBROK=A0 :=A0 netns_netlink.c:143: system() =
failed
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Th=
is is a line number,
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if=
 you look a the
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 so=
urce code of the
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 te=
st, you see:
> =

>  =A0=A0=A0=A0=A0=A0=A0 if (WEXITSTATUS(system("ip tuntap add dev dummy0 m=
ode tap")))
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tst_brkm(TBROK, cleanup, "=
system() failed");
> =

> So that the failed command was "ip tuntap add dev dummy0 mode tap", it's =

> up to
> you to figure out why...
> =

> --
> Cyril Hrubis
> chrubis@suse.cz
> [EXT]
> =

> =




-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
