Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4A727E88A
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 14:28:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEE5D3C4C02
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 14:28:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A926D3C27DE
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 14:28:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 740FC60102B
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 14:28:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,322,1596470400"; d="scan'208,217";a="99786737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Sep 2020 20:28:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id DCBE348990D5;
 Wed, 30 Sep 2020 20:28:01 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Sep 2020 20:27:59 +0800
Message-ID: <5F7479CF.4090007@cn.fujitsu.com>
Date: Wed, 30 Sep 2020 20:27:59 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200929025606.322543-1-yangx.jy@cn.fujitsu.com>
 <20200930104709.GC6611@yuki.lan>
In-Reply-To: <20200930104709.GC6611@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DCBE348990D5.AB9C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuset_base_ops_testset.sh: Accept
 either 0 or -EINVAL when passing '0-'
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
Cc: ltp@lists.linux.it, rpalethorpe@suse.com
Content-Type: multipart/mixed; boundary="===============1649103066=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1649103066==
Content-Type: multipart/alternative;
	boundary="------------010308020900070409020808"

--------------010308020900070409020808
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2020/9/30 18:47, Cyril Hrubis wrote:
> Hi!
>> When we write '0-' to cpuset.cpus/cpuset.mems, new bitmap_parselist()
>> in kernel(e.g. newer than v4.2) treats it as an invalid value and old
>> one treats it as a valid '0':
>> -------------------------------------------
>> on v5.8.0:
>>   # echo 0->  cpuset.cpus
>>   -bash: echo: write error: Invalid argument
>>   # echo 0->  cpuset.mems
>>   -bash: echo: write error: Invalid argument
>>
>> on v4.0.0:
>>   # echo '0-'>cpuset.cpus
>>   # cat cpuset.cpus
>>   0
>>   # echo '0-'>cpuset.mems
>>   # cat cpuset.cpus
>>   0
>> -------------------------------------------
>> Note: commit d9282cb66353b changes the behavior.
>>
>> Drop the check of kernel version and accept either 0 or -EINVAL
>> because the change of behavior can be backported into old kernel.
> Why can't we just simply adjust the kernel check, it looks like the
> commit you mentioned was added to 4.3 so it should be fixed by changing
> the line to:
>
> 	if tst_kvcmp -lt "4.3 RHEL6:2.6.32"; then
>
> We want to at least keep the check for kernels newer than 4.3 just to
> make sure that kernel keeps rejecting the '0-' invalid value.
Hi Cyril,

Thanks for your reply. :-)
1) I still got '0' value instead of -EINVAL on Centos 6.10(2.6.32-754) 
so not sure why we have the wrong kernel check before.
     Perhaps, is there anothe older kernel commit to change the behavior 
as well?
2) I don't think that kernel check is enough because  the change of 
behavior may be backported into old kernel.

How about removing the combination directly as Richard suggested on #695.

Best Regards,
Xiao Yang



--------------010308020900070409020808
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 2020/9/30 18:47, Cyril Hrubis wrote:
    <blockquote cite="mid:20200930104709.GC6611@yuki.lan" type="cite">
      <pre wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre wrap="">When we write '0-' to cpuset.cpus/cpuset.mems, new bitmap_parselist()
in kernel(e.g. newer than v4.2) treats it as an invalid value and old
one treats it as a valid '0':
-------------------------------------------
on v5.8.0:
 # echo 0- &gt; cpuset.cpus
 -bash: echo: write error: Invalid argument
 # echo 0- &gt; cpuset.mems
 -bash: echo: write error: Invalid argument

on v4.0.0:
 # echo '0-' &gt;cpuset.cpus
 # cat cpuset.cpus
 0
 # echo '0-' &gt;cpuset.mems
 # cat cpuset.cpus
 0
-------------------------------------------
Note: commit d9282cb66353b changes the behavior.

Drop the check of kernel version and accept either 0 or -EINVAL
because the change of behavior can be backported into old kernel.
</pre>
      </blockquote>
      <pre wrap="">
Why can't we just simply adjust the kernel check, it looks like the
commit you mentioned was added to 4.3 so it should be fixed by changing
the line to:

	if tst_kvcmp -lt "4.3 RHEL6:2.6.32"; then

We want to at least keep the check for kernels newer than 4.3 just to
make sure that kernel keeps rejecting the '0-' invalid value.
</pre>
    </blockquote>
    Hi Cyril,<br>
    <br>
    Thanks for your reply. <span class="moz-smiley-s1"><span> :-) </span></span><br>
    1) I still got '0' value instead of -EINVAL on Centos
    6.10(2.6.32-754) so not sure why we have the wrong kernel check
    before.<br>
    &nbsp; &nbsp; Perhaps, is there anothe older kernel commit to change the
    behavior as well?<br>
    2) I don't think that kernel check is enough because&nbsp; the change of
    behavior may be backported into old kernel.<br>
    <br>
    How about removing the combination directly as Richard suggested on
    #695.<br>
    <br>
    Best Regards,<br>
    Xiao Yang<br>
    <span style="display: inline ! important; float: none;
      background-color: rgb(255, 255, 255); color: rgb(51, 51, 51);
      font: 13px/21px Arial,sans-serif; letter-spacing: normal; orphans:
      2; text-align: left; text-decoration: none; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;"></span>
  </body>
</html>

--------------010308020900070409020808--

--===============1649103066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1649103066==--
