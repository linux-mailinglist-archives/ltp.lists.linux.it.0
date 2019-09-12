Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A8B072D
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 05:35:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DEB43C20A9
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 05:35:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9DCCB3C0507
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:35:19 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D62D61A00E14
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:35:18 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8C3XsYF032940;
 Thu, 12 Sep 2019 03:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=corp-2019-08-05;
 bh=cohzqE4B5r5pgIVLTzO4fOBoCsj5Nwe0FVly9WAV37E=;
 b=hIoxSIKUYOmbe16jqtWAm9I6vRmpKHvm8yJTY2/t4X62rJInS3Nyw3SBZPg8TxlxG6UM
 VrPwA0oraj2E9LBfU/mD0GGjWEeIzzFEHuu1mDbdCHE8VkEmHuM4FgZLh6sRoCxVi6F/
 ZkClkZn0hNOY9DG9aXKCb8ftMuwmOFoC4Qh7g2NIzPuQMpPor/Uy4VfIZXYMDS3gnM6o
 TAHuYm1mGbPqtCPI77YPsd8jGAZ6UxSiL1rm0lQYHfAT3yCjcY3Y1naALqgD3dl2Kk9Y
 PZH76wLtdTBHhOhqbqYoba5LNed0mvmXoFANk9EjzyZSGjPjw5GDFWN/WJbjgFRnwt7a TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2uw1jknq8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 03:35:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8C3XKgw066222;
 Thu, 12 Sep 2019 03:35:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2uy8w99s5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 03:35:15 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8C3ZCk6006875;
 Thu, 12 Sep 2019 03:35:12 GMT
Received: from [10.191.17.180] (/10.191.17.180)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Sep 2019 20:35:12 -0700
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
 <20190911111900.GA19244@rei.lan>
 <CAEemH2eMYmquWXAHXUuPQ1Li2DSfvHpV01O4GMQFZ0Z0s=8+hw@mail.gmail.com>
From: Shuang Qiu <shuang.qiu@oracle.com>
Message-ID: <cd3c30eb-e716-dfcc-6a45-f16c76286358@oracle.com>
Date: Thu, 12 Sep 2019 11:35:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2eMYmquWXAHXUuPQ1Li2DSfvHpV01O4GMQFZ0Z0s=8+hw@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=906
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=964 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120033
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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
Content-Type: multipart/mixed; boundary="===============0278184424=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0278184424==
Content-Type: multipart/alternative;
 boundary="------------D134ACA439B7CCD06041083B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D134ACA439B7CCD06041083B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2019 10:51 AM, Li Wang wrote:
>
>
> On Wed, Sep 11, 2019 at 7:19 PM Cyril Hrubis <chrubis@suse.cz 
> <mailto:chrubis@suse.cz>> wrote:
>
>     Hi!
>     > I'm not sure why 64 pages is a proper value? Can you explain more?
>
>     I've just talked to Michal Hocko and the conclusion is that we should
>     allocate several megabytes to avoid depending kernel implementation
>     details, which would mean allocating thousands of pages.
>
>
> Sounds reasonable. Allocating thousands of pages must trigger 
> the MADV_FREE page reclaiming.
>
> @shuang.qiu, Hi Shuang, would you mind to rewrite the patch, or should 
> I do that?
Thanks for helping to investigate this issue.
I will update the patch.
32 pages is really small in current system which may be held on 
reclaiming small piece of memory,thousands of pages is reasonable.

Thanks
Shuang
>
> -- 
> Regards,
> Li Wang



--------------D134ACA439B7CCD06041083B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 09/12/2019 10:51 AM, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2eMYmquWXAHXUuPQ1Li2DSfvHpV01O4GMQFZ0Z0s=8+hw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Sep 11, 2019 at 7:19
            PM Cyril Hrubis &lt;<a href="mailto:chrubis@suse.cz"
              target="_blank" moz-do-not-send="true">chrubis@suse.cz</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi!<br>
            &gt; I'm not sure why 64 pages is a proper value? Can you
            explain more?<br>
            <br>
            I've just talked to Michal Hocko and the conclusion is that
            we should<br>
            allocate several megabytes to avoid depending kernel
            implementation<br>
            details, which would mean allocating thousands of pages.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default">Sounds reasonable. Allocating
              thousands of pages must trigger the MADV_FREE page
              reclaiming.</div>
          </div>
          <div><br>
          </div>
        </div>
        <div class="gmail_default" style="font-size:small">@shuang.qiu,
          Hi Shuang, would you mind to rewrite the patch, or should I do
          that?</div>
      </div>
    </blockquote>
    Thanks for helping to investigate this issue.<br>
    I will update the patch.<br>
    32 pages is really small in current system which may be held on
    reclaiming small piece of memory,thousands of pages is reasonable.<br>
    <br>
    Thanks<br>
    Shuang<br>
    <blockquote type="cite"
cite="mid:CAEemH2eMYmquWXAHXUuPQ1Li2DSfvHpV01O4GMQFZ0Z0s=8+hw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="m_9063406343708931987gmail_signature">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------D134ACA439B7CCD06041083B--

--===============0278184424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0278184424==--
