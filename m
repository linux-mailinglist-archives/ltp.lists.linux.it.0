Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF821F373D
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:48:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA8063C61C6
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:48:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C1EF93C2E49
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:48:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6ACD610005CC
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:48:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,491,1583164800"; d="scan'208,217";a="94161326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 17:48:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7AEA950A9975;
 Tue,  9 Jun 2020 17:48:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 17:48:25 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
Date: Tue, 9 Jun 2020 17:48:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7AEA950A9975.ADB03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Get the logic_block_size
 dynamically
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
Content-Type: multipart/mixed; boundary="===============2042700644=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2042700644==
Content-Type: multipart/alternative;
	boundary="------------922A86DDE747D5ADB4F389E8"

--------------922A86DDE747D5ADB4F389E8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan

>
> ----- Original Message -----
>> In loop driver code, the sb_bsize was calculated as below
>> sb_bsize = bdev_logical_block_size(inode->i_sb->s_bdev),
>>
>> it is the super block's block size that the backing file's inode belongs to,
>> not by using the st_blksize member of stat struct(it uses inode->i_blkbits).
> I'm not sure I follow the above, are you saying the difference is bdev blksize
> vs. filesystem blksize?

I said the loop driver used  dev_logical_block_size(inode->i_sb->s_bdev) but not using
st_blksize. I don't see they have conversion formula so using st_blksize maybe wrong.

>   Is the test failing in some scenarios or is this
> fix based on code inspection?

It affects the result of  ("With nonzero offset less than logical_block_size").
When we can get sb_bdev on other machine(not s390), it should report EINVAL error.

But if we use stat.st_blksize, it passed.

not using st_blksize， result as below:
ioctl_loop05.c:81: INFO: With nonzero offset less than logical_block_size
ioctl_loop05.c:92: PASS: LOOP_SET_DIRECT_IO failed as expected: EINVAL (22)

using st_blksize， result as below:
ioctl_loop05.c:81: INFO: With nonzero offset less than logical_block_size
ioctl_loop05.c:87: PASS: LOOP_SET_DIRECT_IO succeeded


>
>> IMO, we don't have the direct ioctl to get this size, just try it from 512 to
>> page_size.
> Would BLKSSZGET work? It returns bdev_logical_block_size().

But it needs a blockdev, in user space, we can specify bdev, but how can we figure out this inode->i_sb->s_bdev block dev.

>
>
>



--------------922A86DDE747D5ADB4F389E8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Jan</pre>
    <blockquote type="cite"
      cite="mid:218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com">
      <pre class="moz-quote-pre" wrap="">

----- Original Message -----
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In loop driver code, the sb_bsize was calculated as below
sb_bsize = bdev_logical_block_size(inode-&gt;i_sb-&gt;s_bdev),

it is the super block's block size that the backing file's inode belongs to,
not by using the st_blksize member of stat struct(it uses inode-&gt;i_blkbits).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not sure I follow the above, are you saying the difference is bdev blksize
vs. filesystem blksize?</pre>
    </blockquote>
    <pre>I said the loop driver used  dev_logical_block_size(inode-&gt;i_sb-&gt;s_bdev) but not using 
st_blksize. I don't see they have conversion formula so using st_blksize maybe wrong.

</pre>
    <blockquote type="cite"
      cite="mid:218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com">
      <pre class="moz-quote-pre" wrap=""> Is the test failing in some scenarios or is this
fix based on code inspection?</pre>
    </blockquote>
    <pre>It affects the result of  ("With nonzero offset less than logical_block_size").
When we can get sb_bdev on other machine(not s390), it should report EINVAL error.

But if we use stat.st_blksize, it passed.

not using st_blksize， result as below:
ioctl_loop05.c:81: INFO: With nonzero offset less than logical_block_size
ioctl_loop05.c:92: PASS: LOOP_SET_DIRECT_IO failed as expected: EINVAL (22)

using st_blksize， result as below:
ioctl_loop05.c:81: INFO: With nonzero offset less than logical_block_size
ioctl_loop05.c:87: PASS: LOOP_SET_DIRECT_IO succeeded


</pre>
    <blockquote type="cite"
      cite="mid:218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
IMO, we don't have the direct ioctl to get this size, just try it from 512 to
page_size.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Would BLKSSZGET work? It returns bdev_logical_block_size().</pre>
    </blockquote>
    <pre>But it needs a blockdev, in user space, we can specify bdev, but how can we figure out this inode-&gt;i_sb-&gt;s_bdev block dev. </pre>
    <blockquote type="cite"
      cite="mid:218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com">
      <pre class="moz-quote-pre" wrap="">



</pre>
    </blockquote>
  </body>
</html>

--------------922A86DDE747D5ADB4F389E8--

--===============2042700644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2042700644==--
