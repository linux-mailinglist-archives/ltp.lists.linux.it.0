Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349921548E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 11:21:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3A543C29D9
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 11:21:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C8A5E3C1CEF
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 11:21:29 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4F4D4600961
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 11:20:24 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06693uJi090629; Mon, 6 Jul 2020 05:21:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322m3bx6he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 05:21:23 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 066947uD091517;
 Mon, 6 Jul 2020 05:21:23 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322m3bx6gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 05:21:23 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0669EDmO026159;
 Mon, 6 Jul 2020 09:21:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 322hd824qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 09:21:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0669LIJY51052716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 09:21:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 616F3A405F;
 Mon,  6 Jul 2020 09:21:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2E51A405C;
 Mon,  6 Jul 2020 09:21:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.42])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 09:21:16 +0000 (GMT)
To: Li Wang <liwang@redhat.com>
References: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
 <9562fdf4debd759439ee7f468008177003db9513.1592457867.git.viresh.kumar@linaro.org>
 <CAEemH2cu_o2eCHQB1_Bo0aQiR2WK6knbBtD83-5_77gZZbA-Ow@mail.gmail.com>
 <20200703125927.GA11556@yuki.lan>
 <CAEemH2cN735haDmyqbNa_LwDgumFqAspYfJaKRpsOg0Rij9tEA@mail.gmail.com>
 <1513894e-d23e-055e-df27-d8cf36b8c609@linux.ibm.com>
 <CAEemH2eSer9ewwSqfs5SA491veL1sy7Xhktkoi6gOT+r3uDQtg@mail.gmail.com>
From: Harish <harish@linux.ibm.com>
Message-ID: <8a9a0eb5-0ef1-6140-0dd3-93fe6f5d8910@linux.ibm.com>
Date: Mon, 6 Jul 2020 14:51:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2eSer9ewwSqfs5SA491veL1sy7Xhktkoi6gOT+r3uDQtg@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_07:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 cotscore=-2147483648 phishscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007060072
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Donghai Qiao <dqiao@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1379821494=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1379821494==
Content-Type: multipart/alternative;
 boundary="------------7C1AA9546C07AA96E4EFAC6C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7C1AA9546C07AA96E4EFAC6C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/20 2:27 PM, Li Wang wrote:
>
> Harish <harish@linux.ibm.com <mailto:harish@linux.ibm.com>> wrote:
>
>     Hi,
>
>     I tried the suggested patch, but was unsuccessful in running the
>     test. Here is my diff.
>     ...
>     Is there anything I am missing here? Thanks in advance.
>
> Your diff version looks correct.
>
> I doubt have you rebuild your LTP or at least rebuild the ltp-lib?
My bad, I did rebuild the ltp with the diff. But it required a clean 
before I do so.
I can confirm tests are running now.

Thanks.
>
> -- 
> Regards,
> Li Wang

--------------7C1AA9546C07AA96E4EFAC6C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 7/6/20 2:27 PM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2eSer9ewwSqfs5SA491veL1sy7Xhktkoi6gOT+r3uDQtg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Harish &lt;<a
              href="mailto:harish@linux.ibm.com" moz-do-not-send="true">harish@linux.ibm.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p><font size="-1">Hi,<br>
                  <br>
                  I tried the suggested patch, but was unsuccessful in
                  running the test. Here is my diff.<br>
                  <span class="gmail_default" style="font-size:small">...</span><br>
                  Is there anything I am missing here? Thanks in
                  advance.<br>
                </font></p>
            </div>
          </blockquote>
          <div>
            <div class="gmail_default" style="font-size:small">Your diff
              version looks correct.<br>
            </div>
            <br>
          </div>
          <div class="gmail_default" style="font-size:small">I doubt
            have you rebuild your LTP or at least rebuild the ltp-lib?<br>
          </div>
        </div>
      </div>
    </blockquote>
    <font size="-1">My bad, I did rebuild the ltp with the diff. But it
      required a clean before I do so.<br>
      I can confirm tests are running now.<br>
      <br>
      Thanks.<br>
    </font>
    <blockquote type="cite"
cite="mid:CAEemH2eSer9ewwSqfs5SA491veL1sy7Xhktkoi6gOT+r3uDQtg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------7C1AA9546C07AA96E4EFAC6C--


--===============1379821494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1379821494==--

