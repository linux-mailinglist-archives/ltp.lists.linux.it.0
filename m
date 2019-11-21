Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E810497C
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 04:59:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3613E3C2055
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 04:59:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4EFB33C074B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 04:59:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 76C4D616E09
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 04:59:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208,217";a="78826940"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 11:59:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 31FA24CE1C8A;
 Thu, 21 Nov 2019 11:51:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 21 Nov 2019 11:59:44 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115155123.GA658@x230>
 <989b7cbfa4cf4d7bb65c9b7df45b8c37@G08CNEXMBPEKD04.g08.fujitsu.local>
 <20191120170948.GA7010@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <29a09da1-0869-0809-ab26-995b6b078453@cn.fujitsu.com>
Date: Thu, 21 Nov 2019 11:59:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191120170948.GA7010@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 31FA24CE1C8A.AD63B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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
Content-Type: multipart/mixed; boundary="===============0546096571=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0546096571==
Content-Type: multipart/alternative;
	boundary="------------7BD0C52A063354DD210DE27B"

--------------7BD0C52A063354DD210DE27B
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/11/21 1:09, Petr Vorel wrote:

> Hi Xu,
>
>>>>   	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
>>>> +	if (TST_ERR == EINVAL) {
>>>> +		tst_res(TCONF, "Current system doesn't support this cmd");
>>> nit: cmd? Maybe something like "quotactl() syscall does not support this command"
>>> or "quotactl() syscall does not support to %s", tc->des to follow other messages. I'd actually prefer to have some macro, which prints QCMD flags, but that's a detail which we can >ignore.
>> I think we can add some info before each run (such as prctl02.c and copy_file_range02.c, make error cases more clear ), as below:
>> 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);  // this tname is a QCMD_string
> +1.  It could use similar approach as it's in testcases/kernel/syscalls/mbind/mbind01.c
>
> #define POLICY_DESC(x) .policy = x, .desc = #x
> #define POLICY_DESC_TEXT(x, y) .policy = x, .desc = #x" ("y")"
>
> static struct test_case tcase[] = {
> 	{
> 		POLICY_DESC(MPOL_DEFAULT),
> 		...
> 	},
> 	{
> 		POLICY_DESC_TEXT(MPOL_DEFAULT, "target exists"),
>
> But I'd prefer to have it as a separate patch after v4 of this patchset is merged.
> I'd prefer to finish v4 (I've already fixed small formatting things, I can fix
> the rest of needed things myself).

Hi Petr

  Using a macro is a better way.

Thanks
Yang Xu

>
> Kind regards,
> Petr
>
>



--------------7BD0C52A063354DD210DE27B
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/21 1:09, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191120170948.GA7010@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""> 	TEST(quotactl(tc-&gt;cmd, tst_device-&gt;dev, *tc-&gt;id, tc-&gt;addr));
+	if (TST_ERR == EINVAL) {
+		tst_res(TCONF, "Current system doesn't support this cmd");
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">nit: cmd? Maybe something like "quotactl() syscall does not support this command"
or "quotactl() syscall does not support to %s", tc-&gt;des to follow other messages. I'd actually prefer to have some macro, which prints QCMD flags, but that's a detail which we can &gt;ignore.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think we can add some info before each run (such as prctl02.c and copy_file_range02.c, make error cases more clear ), as below:
	tst_res(TINFO, "Test #%d: %s", n, tc-&gt;tname);  // this tname is a QCMD_string
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
+1.  It could use similar approach as it's in testcases/kernel/syscalls/mbind/mbind01.c

#define POLICY_DESC(x) .policy = x, .desc = #x
#define POLICY_DESC_TEXT(x, y) .policy = x, .desc = #x" ("y")"

static struct test_case tcase[] = {
	{
		POLICY_DESC(MPOL_DEFAULT),
		...
	},
	{
		POLICY_DESC_TEXT(MPOL_DEFAULT, "target exists"),

But I'd prefer to have it as a separate patch after v4 of this patchset is merged.
I'd prefer to finish v4 (I've already fixed small formatting things, I can fix
the rest of needed things myself).</pre>
    </blockquote>
    <pre>Hi Petr 
</pre>
    <pre> Using a macro is a better way. 

Thanks
Yang Xu
</pre>
    <blockquote type="cite" cite="mid:20191120170948.GA7010@dell5510">
      <pre class="moz-quote-pre" wrap="">

Kind regards,
Petr


</pre>
    </blockquote>
  </body>
</html>

--------------7BD0C52A063354DD210DE27B--

--===============0546096571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0546096571==--
