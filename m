Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB82AB018
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 04:57:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F1B73C2FD2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 04:57:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1067F3C256C
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 04:57:04 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9DE4A60029A
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 04:57:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,462,1596470400"; 
 d="scan'208,217";a="101075353"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 11:56:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id C49844CE3A4A;
 Mon,  9 Nov 2020 11:56:57 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 11:56:54 +0800
Message-ID: <5FA8BE07.4040201@cn.fujitsu.com>
Date: Mon, 9 Nov 2020 11:56:55 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com> <20201107165518.GB10159@pevik>
In-Reply-To: <20201107165518.GB10159@pevik>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C49844CE3A4A.A9EAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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
Content-Type: multipart/mixed; boundary="===============2056551473=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2056551473==
Content-Type: multipart/alternative;
	boundary="------------020309070903070800050706"

--------------020309070903070800050706
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On  020/11/8 0:55, Petr Vorel wrote:
> Hi,
>
>> On 11/7/20 12:47 AM, Cyril Hrubis wrote:
>>> Hi!
>>>> I have a doubt after reading Xu's patch[1] and Martin's patch[2]:
>>>> 1) Xu removed sync01 because sync() always return 0.
>>> Actually sync() is defined as void function, so the tests were bogusly
>>> checking the TST_RET value which haven't been set at all.
>> Hi Cyril,
>> Oops, I gave a wrong example. :-(
>> On error, I just wonder if we need to check all return value(i.e. negative
>> value except -1).
>> IOW, Is it possible for syscall to get a error value which is not -1?
> There are probably other examples, but I've found only these:
>
> man malloc_get_state(3)
>
> 	If the implementation detects that state does not point to a correctly
> 	formed data structure, malloc_set_state() returns -1.
> 	If the implementation detects that the version of the data structure
> 	referred to by state is a more recent version than this implementation knows
> 	about, malloc_set_state() returns -2.
>
> man mmap(2)
> 	On error, the value MAP_FAILED (that is, (void *) -1) is returned.
Hi,

Sorry, I didn't describe the doubt clearly.
For example:
1) open(2) will return -1 if an error occur.
     Is it necessary to check invalid return value(except -1) if an 
error occur?
2) mmap(2) will return MAP_FAILED if an error occurs.
     Is it necessary to check invalid value(except MAP_FAILED) if an 
error occur?
Martin's patches have added a check for invalid return value in many 
safe macros but a lot of syscall tests(e.g. after doingTEST()) don't add 
the check for now.
I am not sure if we need to add the check for all syscall tests. :-)
BTW: In my opinion, it is hardly to get invalid return value so the 
check seems unnecessary and redundance.

Best Regards,
Xiao Yang
>> Best Regards,
>> Xiao Yang
>
> Kind regards,
> Petr
>




--------------020309070903070800050706
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
    <title></title>
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On &nbsp;020/11/8 0:55, Petr Vorel&nbsp;wrote:
    <blockquote cite="mid:20201107165518.GB10159@pevik" type="cite">
      <pre wrap="">Hi,

</pre>
      <blockquote type="cite">
        <pre wrap="">On 11/7/20 12:47 AM, Cyril Hrubis wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hi!
</pre>
          <blockquote type="cite">
            <pre wrap="">I have a doubt after reading Xu's patch[1] and Martin's patch[2]:
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">1) Xu removed sync01 because sync() always return 0.
</pre>
          </blockquote>
          <pre wrap="">Actually sync() is defined as void function, so the tests were bogusly
checking the TST_RET value which haven't been set at all.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Cyril,
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Oops, I gave a wrong example. :-(
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">On error, I just wonder if we need to check all return value(i.e. negative
value except -1).
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">IOW, Is it possible for syscall to get a error value which is not -1?
</pre>
      </blockquote>
      <pre wrap="">There are probably other examples, but I've found only these:

man malloc_get_state(3)

	If the implementation detects that state does not point to a correctly
	formed data structure, malloc_set_state() returns -1.
	If the implementation detects that the version of the data structure
	referred to by state is a more recent version than this implementation knows
	about, malloc_set_state() returns -2.

man mmap(2)
	On error, the value MAP_FAILED (that is, (void *) -1) is returned.
</pre>
    </blockquote>
    Hi,<br>
    <br>
    Sorry, I didn't describe the doubt clearly.<br>
    For example:<br>
    1) open(2) will return -1 if an error occur.<br>
    &nbsp;&nbsp;&nbsp; Is it necessary to check invalid return value(except -1) if an
    error occur?<br>
    2) mmap(2) will return MAP_FAILED if an error occurs.<br>
    &nbsp;&nbsp;&nbsp; Is it necessary to check invalid value(except MAP_FAILED) if an
    error occur?<br>
    Martin's patches have added a check for invalid return value in many
    safe macros but a lot of syscall tests(e.g. after doingTEST()) don't
    add the check for now.<br>
    I am not sure if we need to add the check for all syscall tests. <span
      class="moz-smiley-s1"><span> :-) </span></span><br>
    BTW: In my opinion, <span style="display: inline ! important;
      float: none; background-color: rgb(255, 255, 255); color: rgb(51,
      51, 51); font: 13px/21px Arial,sans-serif; letter-spacing: normal;
      orphans: 2; text-align: left; text-decoration: none; text-indent:
      0px; text-transform: none; white-space: normal; word-spacing:
      0px;"></span>it is hardly to get invalid return value so the check
    seems unnecessary and redundance.<br>
    &nbsp;<br>
    Best Regards,<br>
    Xiao Yang<br>
    <blockquote cite="mid:20201107165518.GB10159@pevik" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Best Regards,
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Xiao Yang
</pre>
      </blockquote>
      <pre wrap="">

Kind regards,
Petr

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020309070903070800050706--

--===============2056551473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2056551473==--
