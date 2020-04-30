Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E61BEEA5
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 05:23:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21B0F3C5ED7
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 05:23:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 63F883C28F0
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 05:23:44 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3B88D1A00E6D
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 05:23:42 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="90801342"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 11:23:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9166650A996E;
 Thu, 30 Apr 2020 11:23:34 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 11:23:35 +0800
To: Linus Torvalds <torvalds@linux-foundation.org>, Li Wang <liwang@redhat.com>
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
 <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
 <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
 <CAEemH2ee7c55=EQb5qohpu40XMACSOCrSStwWt7u=_GyqjrxLw@mail.gmail.com>
 <CAHk-=wg7u4AjZQd49VjrZXikDMfK-HchOKHYqoUFwcXjsbJ3XQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <36bd1e20-414b-ec24-f7e3-16ef7e2395d9@cn.fujitsu.com>
Date: Thu, 30 Apr 2020 11:23:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg7u4AjZQd49VjrZXikDMfK-HchOKHYqoUFwcXjsbJ3XQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9166650A996E.AB31D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Cc: David Howells <dhowells@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Linus


> On Sun, Apr 26, 2020 at 4:59 AM Li Wang <liwang@redhat.com> wrote:
>>
>>  From kernel code seems you are right. The pipe indeed takes use of PAGE_SIZE(ppc64le: 64kB) to split the writes data in the packetized mode (marked by O_DIRECT). But in the manual page, O_DIRECT indicates us the PIPE_BUF is the correct atomic unit.
> 
> The manual is correct.
> 
> PIPE_BUF is the size we _guarantee_ can be used atomically.
> 
> The fact that in practice we do have bigger buffers on some platforms
> is an implementation detail.
> 
> Yes, that implementation detail can be visible, but basically any test
> code that tries to test for "what if we use a bigger bug that
> PIPE_BUF" is buggy. It's simply not guaranteed to work any more.
> 
> O_DIRECT is kind of immaterial, except it's just one of those things
> where the atomic size is slightly more visible. But basically,
> packetized pipes with bigger packets than PIPE_BUF is random behavior.
> It may work. It may not.
Thanks for your explanation. I am more curious about the user scene of 
this flag.

@Li, so how to design this test? In this test, we don't have complex 
scene to test this automic unit.

Best Regards
Yang Xu
> 
>                  Linus
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
