Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83067FD850
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 10:03:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 373CC3C237B
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 10:03:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9E1B63C234D
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 10:02:59 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 63F7514D5F28
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 10:02:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,307,1569254400"; d="scan'208,217";a="78502045"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Nov 2019 17:02:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id EFB4B4CE1A11;
 Fri, 15 Nov 2019 16:54:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 15 Nov 2019 17:02:50 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <421bebaf-d8c0-380f-2a25-a2212058d476@cn.fujitsu.com>
Message-ID: <01929f2e-8a55-1f2e-cd23-3f47cd3877bc@cn.fujitsu.com>
Date: Fri, 15 Nov 2019 17:02:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <421bebaf-d8c0-380f-2a25-a2212058d476@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EFB4B4CE1A11.A0D98
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/5] optimize quotactl test code
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
Content-Type: multipart/mixed; boundary="===============1555432267=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1555432267==
Content-Type: multipart/alternative;
	boundary="------------4AB206FA5CD1BBAEEB7F57E2"

--------------4AB206FA5CD1BBAEEB7F57E2
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi
Does anyone have some comments for this patch set?

> Hi All
> ping.
>> I cleanup the quotactl code and add project quota test for quotactl.
>> Thanks to Jan Kara with support about quota.
>>
>>
>> ------------
>> v2->v3:
>> 1.for quotactl02.c, add group quota test
>> 2.add quotactl04.c and add quota05.c to test project quota.
>> 3.add quotactl06.c to test error
>> 4. fix build erro on centos6
>> ps:don't test Q_XQUOTARM in quotactl02,04 because cycle running will
>> report ENOSYS (quota feture has been off). I will introduce a
>> new test to test it and also a regression test for commit[1].
>> [1]https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&id=3dd4d40b420846dd35869ccc8f8627feef2cff32
>> [2]https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&utm_source=github_status
>> ------------
>>
>> Yang Xu (5):
>>    syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
>>    syscalls/quotactl02.c: Add Q_XGETQSTATV test
>>    syscalls/quotactl04: add project quota test for non-xfs filesystem
>>    syscalls/quotactl05: add project quota test for xfs filesystem
>>    syscalls/quotactl06: Add new testcase
>>
>>   configure.ac                                  |   1 +
>>   include/lapi/quotactl.h                       |  34 +--
>>   m4/ltp-quota.m4                               |   8 +
>>   runtest/syscalls                              |   3 +
>>   testcases/kernel/syscalls/quotactl/.gitignore |   4 +
>>   .../kernel/syscalls/quotactl/quotactl01.c     |  53 +++--
>>   .../kernel/syscalls/quotactl/quotactl02.c     | 193 +++++++-----------
>>   .../kernel/syscalls/quotactl/quotactl02.h     | 152 ++++++++++++++
>>   .../kernel/syscalls/quotactl/quotactl04.c     | 155 ++++++++++++++
>>   .../kernel/syscalls/quotactl/quotactl05.c     |  99 +++++++++
>>   .../kernel/syscalls/quotactl/quotactl06.c     | 183 +++++++++++++++++
>>   11 files changed, 745 insertions(+), 140 deletions(-)
>>   create mode 100644 m4/ltp-quota.m4
>>   create mode 100644 testcases/kernel/syscalls/quotactl/quotactl02.h
>>   create mode 100644 testcases/kernel/syscalls/quotactl/quotactl04.c
>>   create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c
>>   create mode 100644 testcases/kernel/syscalls/quotactl/quotactl06.c
>>



--------------4AB206FA5CD1BBAEEB7F57E2
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Hi 
Does anyone have some comments for this patch set?</pre>
    <blockquote type="cite"
      cite="mid:421bebaf-d8c0-380f-2a25-a2212058d476@cn.fujitsu.com">
      <meta http-equiv="Content-Type" content="text/html; charset=GBK">
      <pre>Hi All
</pre>
      <pre>ping.
</pre>
      <blockquote type="cite"
cite="mid:1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com">
        <pre class="moz-quote-pre" wrap="">I cleanup the quotactl code and add project quota test for quotactl.
Thanks to Jan Kara with support about quota.


------------
v2-&gt;v3:
1.for quotactl02.c, add group quota test
2.add quotactl04.c and add quota05.c to test project quota.
3.add quotactl06.c to test error
4. fix build erro on centos6 
ps:don't test Q_XQUOTARM in quotactl02,04 because cycle running will
report ENOSYS (quota feture has been off). I will introduce a
new test to test it and also a regression test for commit[1].
[1]<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&amp;id=3dd4d40b420846dd35869ccc8f8627feef2cff32" moz-do-not-send="true">https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&amp;id=3dd4d40b420846dd35869ccc8f8627feef2cff32</a>
[2]<a class="moz-txt-link-freetext" href="https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&amp;utm_source=github_status" moz-do-not-send="true">https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&amp;utm_source=github_status</a>
------------

Yang Xu (5):
  syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
  syscalls/quotactl02.c: Add Q_XGETQSTATV test
  syscalls/quotactl04: add project quota test for non-xfs filesystem
  syscalls/quotactl05: add project quota test for xfs filesystem
  syscalls/quotactl06: Add new testcase

 configure.ac                                  |   1 +
 include/lapi/quotactl.h                       |  34 +--
 m4/ltp-quota.m4                               |   8 +
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/quotactl/.gitignore |   4 +
 .../kernel/syscalls/quotactl/quotactl01.c     |  53 +++--
 .../kernel/syscalls/quotactl/quotactl02.c     | 193 +++++++-----------
 .../kernel/syscalls/quotactl/quotactl02.h     | 152 ++++++++++++++
 .../kernel/syscalls/quotactl/quotactl04.c     | 155 ++++++++++++++
 .../kernel/syscalls/quotactl/quotactl05.c     |  99 +++++++++
 .../kernel/syscalls/quotactl/quotactl06.c     | 183 +++++++++++++++++
 11 files changed, 745 insertions(+), 140 deletions(-)
 create mode 100644 m4/ltp-quota.m4
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl02.h
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl04.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl06.c

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4AB206FA5CD1BBAEEB7F57E2--

--===============1555432267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1555432267==--
