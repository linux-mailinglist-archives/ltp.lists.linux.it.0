Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC1158CA8
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:25:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E8533C24D5
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:25:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 13C963C2352
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:25:17 +0100 (CET)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 26C0514019DE
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=oiIwG
 dby0djxX3aylYHWtq8aEJotUPtJpyIRmheEI98=; b=ebD50kPHzSPfAO4PTkMDB
 nDmnwKv/7fl6QFmbryHkE/r85T72S5zYdGKxoEKCU3/H9XTO1e2v6B8r2qWdjlsm
 i0gsKv2Ogn9j08vGCyvfFx7RVhzEbTGvGH/AZWBTs4U63wPyq7f/75k6w+TjRrlb
 FN6D358qF41MlFe3xDGMfw=
Received: from [192.168.0.10] (unknown [223.64.160.102])
 by smtp11 (Coremail) with SMTP id D8CowAC3vxP+gEJewJOuCA--.12199S2;
 Tue, 11 Feb 2020 18:25:03 +0800 (CST)
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
References: <BMXPR01MB29991144C5DF1108F9B38DD9EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <f6cf7d37-cf31-7448-0bea-035eb48f2f79@163.com>
 <BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <6e81635f-c202-9f41-6795-4d6f84290e7e@163.com>
Date: Tue, 11 Feb 2020 18:25:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
X-CM-TRANSID: D8CowAC3vxP+gEJewJOuCA--.12199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr17KrW7ZFW7WF1DAFy5Jwb_yoW8WFy7pr
 WfJwnFyFn8Jw1DZr1IqF1UZF1ftr18A3y5Wr43X3ykt3W5AFyfur97Ga1kJFyUJF93Jw47
 Xr9rJF1rGryUJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSpB3UUUUU=
X-Originating-IP: [223.64.160.102]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEB-GXlUMPPmCjAAAsF
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] test with aio02 is failing with safe_macros.c:223: BROK:
 aio02.c:130: open(file, 16961, 0644) failed: EINVAL (22)
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
Content-Type: multipart/mixed; boundary="===============0891880359=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0891880359==
Content-Type: multipart/alternative;
 boundary="------------8B099DA15987F94FA22B2899"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8B099DA15987F94FA22B2899
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/11/20 6:01 PM, Pankaj Vinadrao Joshi wrote:
> Hi sir,
> I am begginer can you tell how i can  check if tmpfs is mounted on 
> /tmp in your enviroment?

Hi,


You can use df/mount command to do check, as below:

-----------------------------------------------------------------

[root@Fedora-30-vm linux]# df -h | grep '/tmp'
tmpfs           993M  4.0K  993M   1% /tmp

[root@Fedora-30-vm linux]# mount | grep '/tmp'
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,seclabel)

------------------------------------------------------------------

>
> Sir if you have two minutes of time can you elaborate it whats its 
> meaning?

aio02 uses open(O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE | O_CREAT) to

create test file in default /tmp directory and ****O_DIRECT flag may not 
be supported

by tmpfs so calling open() returns EINVAL.


Thanks,

Xiao Yang

>
>
> Thank you 😊
> ------------------------------------------------------------------------
> *From:* Xiao Yang <ice_yangxiao@163.com>
> *Sent:* Tuesday, February 11, 2020 3:04 PM
> *To:* Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
> *Subject:* Re: [LTP] test with aio02 is failing with 
> safe_macros.c:223: BROK: aio02.c:130: open(file, 16961, 0644) failed: 
> EINVAL (22)
>
> Hi,
>
>
> Could you check if tmpfs is mounted on /tmp in your enviroment?
>
> It seems that tmpfs cannot support O_DIRECT flag and creating file 
> with O_DIRECT in tmpfs triggers the error.
>
> Perhaps, you can fix the error by mounting normal filesystem(e.g. 
> ext4/xfs) on /tmp for now.
>
>
> Thanks,
>
> Xiao Yang
>
> On 2/11/20 4:31 PM, Pankaj Vinadrao Joshi wrote:
>> Hi,
>> i am running aio02 test on my RISC v machine,my testing is getting 
>> failed with the message
>> *safe_macros.c:223: BROK: aio02.c:130: open(file,16961,0644) failed: 
>> EINVAL (22)*
>>
> [EXT]

--------------8B099DA15987F94FA22B2899
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/11/20 6:01 PM, Pankaj Vinadrao
      Joshi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi sir,</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        I am begginer can you tell how i can  check if tmpfs is mounted
        on /tmp in your enviroment?</div>
    </blockquote>
    <p>Hi,</p>
    <p><br>
    </p>
    <p>You can use df/mount command to do check, as below:</p>
    <p>-----------------------------------------------------------------<br>
    </p>
    <p>[root@Fedora-30-vm linux]# df -h | grep '/tmp'<br>
      tmpfs           993M  4.0K  993M   1% /tmp</p>
    <p>[root@Fedora-30-vm linux]# mount | grep '/tmp'<br>
      tmpfs on /tmp type tmpfs (rw,nosuid,nodev,seclabel)</p>
    <p>------------------------------------------------------------------<br>
    </p>
    <blockquote type="cite"
cite="mid:BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Sir if you have two minutes of time can you elaborate it whats
        its meaning?</div>
    </blockquote>
    <p>aio02 uses open(O_WRONLY | O_TRUNC | O_DIRECT | O_LARGEFILE |
      O_CREAT) to</p>
    <p>create test file in default /tmp directory and <strong></strong><strong></strong>O_DIRECT
      flag may not be supported</p>
    <p>by tmpfs so calling open() returns EINVAL.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Xiao Yang<br>
    </p>
    <blockquote type="cite"
cite="mid:BMXPR01MB2999C5C6166A34812CFA3727EE180@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Thank you <span id="😊">😊</span><br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b> Xiao
          Yang <a class="moz-txt-link-rfc2396E" href="mailto:ice_yangxiao@163.com">&lt;ice_yangxiao@163.com&gt;</a><br>
          <b>Sent:</b> Tuesday, February 11, 2020 3:04 PM<br>
          <b>To:</b> Pankaj Vinadrao Joshi
          <a class="moz-txt-link-rfc2396E" href="mailto:Pankaj.VJ@exaleapsemi.com">&lt;Pankaj.VJ@exaleapsemi.com&gt;</a><br>
          <b>Subject:</b> Re: [LTP] test with aio02 is failing with
          safe_macros.c:223: BROK: aio02.c:130: open(file, 16961, 0644)
          failed: EINVAL (22)</font>
        <div> </div>
      </div>
      <div style="background-color:#FFFFFF">
        <p>Hi,</p>
        <p><br>
        </p>
        <p>Could you check if tmpfs is mounted on /tmp in your
          enviroment?</p>
        <p>It seems that tmpfs cannot support O_DIRECT flag and creating
          file with O_DIRECT in tmpfs triggers the error.</p>
        <p>Perhaps, you can fix the error by mounting normal
          filesystem(e.g. ext4/xfs) on /tmp for now.<br>
        </p>
        <p><br>
        </p>
        <p>Thanks,</p>
        <p>Xiao Yang<br>
        </p>
        <div class="x_moz-cite-prefix">On 2/11/20 4:31 PM, Pankaj
          Vinadrao Joshi wrote:<br>
        </div>
        <blockquote type="cite">
          <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
          <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
            Hi,<br>
            i am running aio02 test on my RISC v machine,my testing is
            getting failed with the message<br>
            <strong>safe_macros.c:223: BROK: aio02.c:130:
              open(file,16961,0644) failed: EINVAL (22)</strong><br>
          </div>
          <br>
          <fieldset class="x_mimeAttachmentHeader"></fieldset>
        </blockquote>
        [EXT] </div>
    </blockquote>
  </body>
</html>

--------------8B099DA15987F94FA22B2899--


--===============0891880359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0891880359==--

