Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED81E2DFD
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 11:55:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CB013C2369
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 11:55:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BE9BB3C134F
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 11:55:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C744F1A00F78
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 11:55:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,224,1569254400"; d="scan'208,217";a="77414598"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 17:55:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 3197C4CE150C;
 Thu, 24 Oct 2019 17:47:10 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 24 Oct 2019 17:55:04 +0800
To: Jan Kara <jack@suse.cz>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-6-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191024081438.GJ31271@quack2.suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <90c377ff-900a-8384-49bc-e697e33d8316@cn.fujitsu.com>
Date: Thu, 24 Oct 2019 17:55:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191024081438.GJ31271@quack2.suse.cz>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 3197C4CE150C.AA97C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/6] syscalls/quotactl04: add project quota
 test for non-xfs filesystem
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
Content-Type: multipart/mixed; boundary="===============0433344428=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0433344428==
Content-Type: multipart/alternative;
	boundary="------------42735BCA1AE51EB691B20991"

--------------42735BCA1AE51EB691B20991
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/10/24 16:14, Jan Kara wrote:

> On Wed 23-10-19 17:00:30, Yang Xu wrote:
>> This is a variant about quotactl01. It is used to test project quota.
>> I split it into a new case instead of adding it in quotaclt01 because
>> two points:
>> 1)before linux 4.10, ext4 doesn't support project quota
>> 2)on old kernel, kernel doesn't permit mount both prjquota and grpquota together
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> Suggested-by: Jan Kara <jack@suse.cz>
>>
> ...
>> @@ -0,0 +1,159 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> + *
>> + * This testcase checks the basic flag of quotactl(2) for project quota on
>> + * non-XFS filesystems.
>> + *
>> + * 1) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for project.
>> + * 2) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
>> + *    for project.
>> + * 3) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
>> + *    for project.
>> + * 4) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
>> + *    flag for project.
>> + * 5) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
>> + *    flag for project.
>> + * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for project.
>> + * 7) quotactl(2) succeeds to update quota usages with Q_SYNC flag for project.
> Testing Q_SYNC is mostly pointless for project quota as it will just do
> nothing (the quota changes are journalled).

I have no objection about removint Q_SYNC.

>
>> + * 8) quotactl(2) succeeds to get disk quota limit greater than or equal to
>> + *    ID with Q_GETNEXTQUOTA flag for project.
>> + * 9) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
>> + */
> Otherwise the set of checks looks sensible to do basic sanity check of
> quotactl(2) syscall.
>
> 								Honza
>



--------------42735BCA1AE51EB691B20991
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
      <pre>on 2019/10/24 16:14, Jan Kara wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20191024081438.GJ31271@quack2.suse.cz">
      <pre class="moz-quote-pre" wrap="">On Wed 23-10-19 17:00:30, Yang Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This is a variant about quotactl01. It is used to test project quota.
I split it into a new case instead of adding it in quotaclt01 because
two points:
1)before linux 4.10, ext4 doesn't support project quota
2)on old kernel, kernel doesn't permit mount both prjquota and grpquota together

Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
Suggested-by: Jan Kara <a class="moz-txt-link-rfc2396E" href="mailto:jack@suse.cz">&lt;jack@suse.cz&gt;</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">...
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
+ *
+ * This testcase checks the basic flag of quotactl(2) for project quota on
+ * non-XFS filesystems.
+ *
+ * 1) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for project.
+ * 2) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
+ *    for project.
+ * 3) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
+ *    for project.
+ * 4) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
+ *    flag for project.
+ * 5) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
+ *    flag for project.
+ * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for project.
+ * 7) quotactl(2) succeeds to update quota usages with Q_SYNC flag for project.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Testing Q_SYNC is mostly pointless for project quota as it will just do
nothing (the quota changes are journalled).</pre>
    </blockquote>
    <pre>I have no objection about removint Q_SYNC.
</pre>
    <blockquote type="cite"
      cite="mid:20191024081438.GJ31271@quack2.suse.cz">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * 8) quotactl(2) succeeds to get disk quota limit greater than or equal to
+ *    ID with Q_GETNEXTQUOTA flag for project.
+ * 9) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
+ */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Otherwise the set of checks looks sensible to do basic sanity check of
quotactl(2) syscall.

								Honza

</pre>
    </blockquote>
  </body>
</html>

--------------42735BCA1AE51EB691B20991--

--===============0433344428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0433344428==--
