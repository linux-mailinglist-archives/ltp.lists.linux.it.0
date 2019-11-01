Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61273EC1B6
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 12:25:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E648F3C2467
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 12:25:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 12D013C245A
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 12:25:16 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 81185200BB8
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 12:25:14 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208,217";a="77794109"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 19:25:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 4FB9F4CE1511;
 Fri,  1 Nov 2019 19:17:11 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 1 Nov 2019 19:25:12 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1572007183-13661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572512347-30116-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191101084933.GA14639@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <fde85181-ce10-3a85-35aa-14bef2e61888@cn.fujitsu.com>
Date: Fri, 1 Nov 2019 19:24:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191101084933.GA14639@dell5510>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 4FB9F4CE1511.AD2E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/prctl02: add more error tests
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
Content-Type: multipart/mixed; boundary="===============0039424128=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0039424128==
Content-Type: multipart/alternative;
	boundary="------------682815CD11C4D91C78D37CEA"

--------------682815CD11C4D91C78D37CEA
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/01 16:49, Petr Vorel wrote:

> Hi Xu,
>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>>   static struct tst_test test = {
>>   	.tcnt = ARRAY_SIZE(tcases),
>>   	.test = verify_prctl,
>> +	.caps = (struct tst_cap []) {
>> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
>> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
> This fails on some old distros (Debian stable [1], CentOS 6 [2]),
> but also on new (Fedora latest [3]):
>
> undeclared identifier 'CAP_SETPCAP'
>
> Could you please setup travis for your LTP fork and validate builds before
> posting to ML?

Hi Petr
Ok. I use travis before sending quotactl patches, but I forgot to use it for prctl02.

Sorry. I will test my patches in my ltp forklater.

ps: I add missing linux/capability.h to fix this build error and this is building in my ltp fork.

Thanks
Yang Xu

>
> BTW it'd be nice to have this feature in our patchwork [4], but not sure if this
> is available and configurable on our patchwork instance (we don't host it).
>
> Kind regards,
> Petr
>
> [1] https://travis-ci.org/pevik/ltp/jobs/605881703
> [2] https://travis-ci.org/pevik/ltp/jobs/605881705
> [3] https://travis-ci.org/pevik/ltp/jobs/605881704
> [4] https://github.com/linux-test-project/ltp/issues/599
>
>



--------------682815CD11C4D91C78D37CEA
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
      <pre>on 2019/11/01 16:49, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191101084933.GA14639@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_prctl,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This fails on some old distros (Debian stable [1], CentOS 6 [2]),
but also on new (Fedora latest [3]):

undeclared identifier 'CAP_SETPCAP'

Could you please setup travis for your LTP fork and validate builds before
posting to ML?</pre>
    </blockquote>
    <pre>Hi Petr
Ok. I use travis before sending quotactl patches, but I forgot to use it for prctl02.</pre>
    <pre>Sorry. I will test my patches in my ltp fork <span class="gt-baf-term-text"><span class="gt-baf-cell gt-baf-word-clickable">later</span></span>.

ps: I add missing linux/capability.h to fix this build error and this is building in my ltp fork.

Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191101084933.GA14639@dell5510">
      <pre class="moz-quote-pre" wrap="">

BTW it'd be nice to have this feature in our patchwork [4], but not sure if this
is available and configurable on our patchwork instance (we don't host it).

Kind regards,
Petr

[1] <a class="moz-txt-link-freetext" href="https://travis-ci.org/pevik/ltp/jobs/605881703">https://travis-ci.org/pevik/ltp/jobs/605881703</a>
[2] <a class="moz-txt-link-freetext" href="https://travis-ci.org/pevik/ltp/jobs/605881705">https://travis-ci.org/pevik/ltp/jobs/605881705</a>
[3] <a class="moz-txt-link-freetext" href="https://travis-ci.org/pevik/ltp/jobs/605881704">https://travis-ci.org/pevik/ltp/jobs/605881704</a>
[4] <a class="moz-txt-link-freetext" href="https://github.com/linux-test-project/ltp/issues/599">https://github.com/linux-test-project/ltp/issues/599</a>


</pre>
    </blockquote>
  </body>
</html>

--------------682815CD11C4D91C78D37CEA--

--===============0039424128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0039424128==--
