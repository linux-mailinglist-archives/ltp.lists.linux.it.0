Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89C12D676
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 07:03:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E5D13C23ED
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 07:03:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5075B3C207E
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 07:03:33 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 52A401A02417
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 07:03:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577772210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCnC9fSOb4QRoPZfoQebAo1Yw27u6g4h5pVCHpi1RFU=;
 b=ZUCYGTlnfviW4cBsEqhGVpnE7Bp+yGV6Au5jds+b9nTVZN9PFxLFeTHPcsPeHp7eXZ9RIw
 zcDIQvhLb25ggPZzGGljMmUHM3yvsXFEVM2+XNj8Gtb6MlLMGbAmEnV7O5loTUOjO6UP+g
 0zLCBg4REtNowV8CCNNw1g2hqC0+TyQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-R0PNarD_NceD7peqv20WlQ-1; Tue, 31 Dec 2019 01:03:26 -0500
Received: by mail-ot1-f69.google.com with SMTP id 4so17871369otd.17
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 22:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6S6S86KRPq9gtxD3+QIBYIfLca9y67o/IT7qH3MZYco=;
 b=piGGB08oGDMVBeM8qx7xCe9kBb5dzJ+LstL3hhMMLqz+LY6aX7cTiUphg77FJ/4hRN
 aYwtBxr5TVKnpPGf9hwB/3eJ1EavJCfu/PO1UQn+oTRXID77ntSVS/y8O6kIN0Za8w26
 n+rg22V/dmgUaPzieKltSIk2YNk49bqBBd5J3IaIa/ML+MWGaUdQM54bzLIlQ0n6OjYl
 roTGNj27SxygqimyzvXLEUeI09dCdOoMvy/Xyd4Jz2AteTx7wjMu44vHFwBWND7l2ZQL
 AYbxamrInnHhZsPaR2uBuyUM1HedtPrHHzlkuEnP2TfKRM3LrIPw5lFHGNeapUUFEjnc
 tMrg==
X-Gm-Message-State: APjAAAV5WZYd7pdFGzNC7ke3Y0r+iRRC0/6ByIIg/OqW7yFewFOXm8JM
 BT+2G/MmYfrLfASUBzebJhYDMtaQI0Q2fGoioFyYjON9MB9te3MUaCErl50Qp6/+gmsYs7xvcqx
 r5eyhU/kXwDOIk6jM53XSMDClEuk=
X-Received: by 2002:a9d:7:: with SMTP id 7mr74243340ota.26.1577772206247;
 Mon, 30 Dec 2019 22:03:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfNadyb2aGz/IpRvWBx6VXejIBdFoELaHYPH1Jo4AJ4qONIpKfOZ8dCxR/H7AUGMqw7OFJfhlD+EKlJp5QalM=
X-Received: by 2002:a9d:7:: with SMTP id 7mr74243331ota.26.1577772206121; Mon,
 30 Dec 2019 22:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
 <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
In-Reply-To: <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Dec 2019 14:03:15 +0800
Message-ID: <CAEemH2dyHSS20Lf9neVfY6voN-EO60_MQdXjb0Xjy9VsDfbZwA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: R0PNarD_NceD7peqv20WlQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0625613652=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0625613652==
Content-Type: multipart/alternative; boundary="000000000000e2040e059af9b72b"

--000000000000e2040e059af9b72b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> ...
>
>
> I have tried this for many different systems, and it doesn't hit the
> failure at least one time. So if no more comments, I would merge the patc=
h
> as below in the next step.
>
> I have a question.we must call sync()? I think syncfs is more accurate.
>
>
Here we use sync() is to make fs metadata/cache being written back before
testing because there is no obtainable file descriptor 'fd' for the ext4
deferred IO (e.g. initialize the journal and inode tables).

--=20
Regards,
Li Wang

--000000000000e2040e059af9b72b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small" class=3D"g=
mail_default">Hi Yang,</div></div><br><div class=3D"gmail_quote"><div class=
=3D"gmail_attr" dir=3D"ltr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.=
fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquo=
te style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex" class=3D"gmail_quote">
 =20
   =20
 =20
  <div>
    <p><span style=3D"font-size:small" class=3D"gmail_default">...</span></=
p><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote"><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">I have
              tried this for many different systems, and it doesn&#39;t hit
              the failure at least one time. So if no more comments, I
              would merge the patch as below in the next step.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre>I have a question.we must call sync()? I think syncfs is more accu=
rate.</pre></div></blockquote><div><br></div><div><div style=3D"" class=3D"=
gmail_default">Here we use sync() is to make fs metadata/cache being writte=
n back before testing because there is no obtainable=C2=A0file descriptor &=
#39;fd&#39; for the ext4 deferred=C2=A0IO (e.g. initialize the journal and =
inode tables).</div><div style=3D"font-size:small" class=3D"gmail_default">=
<br></div></div></div>-- <br><div class=3D"gmail_signature" dir=3D"ltr"><di=
v dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></di=
v>

--000000000000e2040e059af9b72b--


--===============0625613652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0625613652==--

