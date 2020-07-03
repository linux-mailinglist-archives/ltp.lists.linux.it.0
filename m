Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0021368A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:38:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A5323C2A2D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:38:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2BD113C0271
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:48:18 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E64C60129C
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:48:16 +0200 (CEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0633Wjpe032485; Thu, 2 Jul 2020 23:48:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320s23wccn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 23:48:14 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0633mEIN075450;
 Thu, 2 Jul 2020 23:48:14 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320s23wcc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 23:48:14 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0633iumr002557;
 Fri, 3 Jul 2020 03:48:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 31wwr8376h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 03:48:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0633knYn24379886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 03:46:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4430911C050;
 Fri,  3 Jul 2020 03:48:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 395AF11C04C;
 Fri,  3 Jul 2020 03:48:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.58.252])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 03:48:08 +0000 (GMT)
To: Li Wang <liwang@redhat.com>, Petr Vorel <petr.vorel@gmail.com>
References: <20200701233133.122801-1-petr.vorel@gmail.com>
 <CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com>
From: Harish <harish@linux.ibm.com>
Message-ID: <2c7f1334-0ff1-7530-90fa-7f3ce796a829@linux.ibm.com>
Date: Fri, 3 Jul 2020 09:18:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_18:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=856
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 cotscore=-2147483648 spamscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007030021
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 03 Jul 2020 10:37:40 +0200
Subject: Re: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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
Content-Type: multipart/mixed; boundary="===============1068190245=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1068190245==
Content-Type: multipart/alternative;
 boundary="------------5D286153971FE63A405184DD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5D286153971FE63A405184DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/20 8:30 AM, Li Wang wrote:
> Hi Petr, Harish,
>
> Though the root cause is from the non-ordered node in a special 
> machine, I still think this patch makes sense to numa01, because the 
> function get_mem_cur() make code more readable.
>
> So I'm going to merge both this one and Harish's patch, after doing 
> that, I will also follow Cyril's comment to remove test8(migrate_pages).
>
> Any objections? or comments?
>
Makes sense to me.

Regards,
Harish
>
> On Thu, Jul 2, 2020 at 7:31 AM Petr Vorel <petr.vorel@gmail.com 
> <mailto:petr.vorel@gmail.com>> wrote:
>
>     ...
>     +get_mem_cur()
>      {
>             local pid=$1
>             local node=$(($2 + 2))
>     +       local size=$3
>     +       local numstat=$(numastat -p $pid |awk '/^Total/ {print
>     $'$node'}')
>
>     -       echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
>     +       if [ -z "$numstat" ]; then
>     +               echo 0
>     +               return
>
>
>
>
> Maybe we'd better do TBROK from here if numstat doesn't work well?
>
> -- 
> Regards,
> Li Wang

--------------5D286153971FE63A405184DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 7/3/20 8:30 AM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">Hi Petr,
            Harish,</div>
        </div>
        <div><br>
        </div>
        <div>
          <div class="gmail_default" style="font-size:small">Though the
            root cause is from the non-ordered node in a special
            machine, I still think this patch makes sense to numa01,
            because the function get_mem_cur() make code more readable.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">So I'm
            going to merge both this one and Harish's patch, after doing
            that, I will also follow Cyril's comment to remove
            test8(migrate_pages).</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Any
            objections? or comments?<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <font size="-1">Makes sense to me.<br>
      <br>
      Regards,<br>
      Harish</font><br>
    <blockquote type="cite"
cite="mid:CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Jul 2, 2020 at 7:31
            AM Petr Vorel &lt;<a href="mailto:petr.vorel@gmail.com"
              target="_blank" moz-do-not-send="true">petr.vorel@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><span
              class="gmail_default" style="font-size:small">...</span><br>
            +get_mem_cur()<br>
             {<br>
                    local pid=$1<br>
                    local node=$(($2 + 2))<br>
            +       local size=$3<br>
            +       local numstat=$(numastat -p $pid |awk '/^Total/
            {print $'$node'}')<br>
            <br>
            -       echo $(numastat -p $pid |awk '/^Total/ {print
            $'$node'}')<br>
            +       if [ -z "$numstat" ]; then<br>
            +               echo 0<br>
            +               return<br>
          </blockquote>
          <div><br>
            <br>
            <br>
          </div>
          <div class="gmail_default" style="font-size:small">Maybe we'd
            better do TBROK from here if numstat doesn't work well?</div>
        </div>
        <div><br>
        </div>
        -- <br>
        <div dir="ltr">
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

--------------5D286153971FE63A405184DD--


--===============1068190245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1068190245==--

