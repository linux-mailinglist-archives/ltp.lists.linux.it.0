Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52FB0723
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 05:28:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B2D83C20A7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 05:28:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E57593C04F4
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:28:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1602C1A00CAF
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:28:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208,217";a="75336736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 11:28:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 53FB84CDFAC5;
 Thu, 12 Sep 2019 11:28:28 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 12 Sep 2019 11:28:36 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190827092520.GA28859@dell5510> <20190827095858.GB28859@dell5510>
 <20190827101644.GA30582@rei>
 <05330771-04f6-0fe4-f99d-eb55ff8b733c@cn.fujitsu.com>
 <20190911124714.GA21670@rei.lan>
From: =?UTF-8?B?WHUsIFlhbmcv5b6QIOadqA==?= <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <234dd7e2-8347-28f4-52d5-a1318f3f8efd@cn.fujitsu.com>
Date: Thu, 12 Sep 2019 11:28:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190911124714.GA21670@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 53FB84CDFAC5.A12EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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
Content-Type: multipart/mixed; boundary="===============0425559216=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0425559216==
Content-Type: multipart/alternative;
	boundary="------------61DBAE30D600C716F314101F"

--------------61DBAE30D600C716F314101F
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/09/11 20:47, Cyril Hrubis wrote:

> Hi!
>> Do you mean use getxattr to ensure bitflags are enable or a functions test?
>> I am confused.
> For a given filesystem the support for filling in these flags was added
> at some point to the kernel. If any kernel newer that this version fails
> to fill them up it's a bug.
>
> For ext2 it has been added in:
>
> commit 93bc420ed41df63a18ae794101f7cbf45226a6ef
> Author: yangerkun <yangerkun@huawei.com>
> Date:   Mon Feb 18 09:07:02 2019 +0800
>
>      ext2: support statx syscall
>
> Hence starting kernel 5.0 ext2 (with ext2 driver) has to set the mask.
>
> For ext4 it has been added in:
>
> commit 3209f68b3ca4667069923a325c88b21131bfdf9f
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri Mar 31 18:32:17 2017 +0100
>
> 	statx: Include a mask for stx_attributes in struct statx
>
>
> Hence for ext4 the flags should be enabled since kernel 4.11

Hi Cyril

Thanks, I see. It seems that kernel version check is useful for upstream kernel. But if an LTS linux distribution backports the commit
93bc420 for ext2, this kernel version will make no sense.  I remember ltp has a discussion between EISDIR and EBDAF about
copy_file_range[1]. Also ext2 should enable CONFIG_EXT2_FS_XATTR if we don't use ext4 instead of it.

IMO, we don't need to add kernel enable version check for various filesystems because QA or user can find their system doesn't support
these flags and report this to linux distribution vendor. So these flags may be supported on next release.

If kernel enables these flags fails to fill them up it's a bug.  We can only give some comments  about their enabled commit information.
So user can know it is a bug or a non-supported feature.

ps: I have a question about min_kernel all the time. If a new feature(such as PR_CAP_AMBIENT ) is introduced since upstream kernel 4.3,
but this feature is also backported on low version kernel on some linux distributions. What kind of situation can we use the min_kernel
to distinguish it? what kind of situation we don't need? test-writing-guidelines.txt doesn't mention it.

Thanks
Yang Xu

>
> etc.
>



--------------61DBAE30D600C716F314101F
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/09/11 20:47, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20190911124714.GA21670@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Do you mean use getxattr to ensure bitflags are enable or a functions test?
I am confused.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For a given filesystem the support for filling in these flags was added
at some point to the kernel. If any kernel newer that this version fails
to fill them up it's a bug.

For ext2 it has been added in:

commit 93bc420ed41df63a18ae794101f7cbf45226a6ef
Author: yangerkun <a class="moz-txt-link-rfc2396E" href="mailto:yangerkun@huawei.com">&lt;yangerkun@huawei.com&gt;</a>
Date:   Mon Feb 18 09:07:02 2019 +0800

    ext2: support statx syscall

Hence starting kernel 5.0 ext2 (with ext2 driver) has to set the mask.

For ext4 it has been added in:

commit 3209f68b3ca4667069923a325c88b21131bfdf9f
Author: David Howells <a class="moz-txt-link-rfc2396E" href="mailto:dhowells@redhat.com">&lt;dhowells@redhat.com&gt;</a>
Date:   Fri Mar 31 18:32:17 2017 +0100

	statx: Include a mask for stx_attributes in struct statx


Hence for ext4 the flags should be enabled since kernel 4.11</pre>
    </blockquote>
    <pre>Hi Cyril 
</pre>
    <pre>Thanks, I see. It seems that kernel version check is useful for upstream kernel. But if an LTS linux distribution backports the commit 
93bc420 for ext2, this kernel version will make no sense.  I remember ltp has a discussion between EISDIR and EBDAF about 
copy_file_range[1]. Also ext2 should enable CONFIG_EXT2_FS_XATTR if we don't use ext4 instead of it.  

IMO, we don't need to add kernel enable version check for various filesystems because QA or user can find their system doesn't support
these flags and report this to linux distribution vendor. So these flags may be supported on next release. 

If kernel enables these flags fails to fill them up it's a bug.  We can only give some comments  about their enabled commit information. 
So user can know it is a bug or a non-supported feature.

ps: I have a question about min_kernel all the time. If a new feature(such as PR_CAP_AMBIENT ) is introduced since upstream kernel 4.3, 
but this feature is also backported on low version kernel on some linux distributions. What kind of situation can we use the min_kernel 
to distinguish it? what kind of situation we don't need? test-writing-guidelines.txt doesn't mention it.

Thanks
Yang Xu 
</pre>
    <blockquote type="cite" cite="mid:20190911124714.GA21670@rei.lan">
      <pre class="moz-quote-pre" wrap="">

etc.

</pre>
    </blockquote>
  </body>
</html>

--------------61DBAE30D600C716F314101F--

--===============0425559216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0425559216==--
