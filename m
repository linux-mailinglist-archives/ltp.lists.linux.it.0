Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EB10D0B2
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:43:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817CC3C220B
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 04:43:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 971133C0738
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:43:50 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2A7A4609693
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 04:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574999028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YDF8q0DlsdRjYU96LEpcv4t2v4AjFJz4x3Kniz/gL30=;
 b=CgrESdI3FqsKOGJVtB2l5uHFU6GX5MzyqKVUEYO8/6etC8wplMMF1AzOEc/6kXSI78Qdsa
 YeK3JAgWzHCmJEq0WQ1U88NLGf57tYuscCkmY8nrKsWGntjzhTKVO4SwglaN8en30f2Sis
 JdOr12t/hOVcfZMEbjvz4ZQr1TaL3HA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-WcKYutWnNsi8CXagbR7lUg-1; Thu, 28 Nov 2019 22:43:44 -0500
Received: by mail-oi1-f199.google.com with SMTP id h82so13716285oif.16
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 19:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjal2841uGFtkFMF/RXhhRiH5W28TjMXVWhelYFxFkM=;
 b=TJ4+JAqXJTYzCRHxaR+Opsov3o7Wni4IT5aD6Jur6E+GbD/TXUxX01rpldywc1p/vS
 Mq6470h2IcPzF/kVaoUUqqL03UcNs4x6yiRzglwYsLeaRW3d7J1i101hMlHVToKCP2d9
 RuFsIMBwuzJlqBbmE2uHwNaZ86JhSDYx+5OYaVMW90/h1CWMQSpndW/2B43e54KrwKOJ
 5X00ZcwqYOXwN9BCN7bOwwkkMZvvV4VgGcUyft93P8pO6gNU/I7waRZ22e9PzJobqOSP
 +YGJdMepGUUL+7R7a+1X6GCqeCHa4dnhJPNsrGkXLhtQfMnwoGG5QZ7yOBA9GKk92/6j
 OVjA==
X-Gm-Message-State: APjAAAXVeSzssW+eZkk4rgHdejIblfWur0lvylY6CWMheCk1M65zka2M
 ZvbgAoi9CyAIGWwn1+Btwj1jnX94DYdbEtA/QlNoet2JFWAMQ5JOK2qc90elliOWLd5/cF3UzMK
 kvyB4iFFXbgVAyH+e73SSylombQg=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr3751700oie.138.1574999024268; 
 Thu, 28 Nov 2019 19:43:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1FQyxSx5ZxXNpLUuapN5R3t8jYwcC4EcF6ksXdh2CCLxHMaCyppvDdCvL0GSgD8IkXeoBpeY0kk8drRNeIsE=
X-Received: by 2002:aca:aad8:: with SMTP id t207mr3751690oie.138.1574999023978; 
 Thu, 28 Nov 2019 19:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20191128082945.6495-1-liwang@redhat.com>
 <1766813779.14211710.1574930105928.JavaMail.zimbra@redhat.com>
 <CAEemH2cW+XUARCzyreQQgJnd1HSV506JEn4rt=oGyezXRtLKFw@mail.gmail.com>
 <16eba1ee-8b23-13c5-f496-3758c2b29fc8@163.com>
In-Reply-To: <16eba1ee-8b23-13c5-f496-3758c2b29fc8@163.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 29 Nov 2019 11:43:33 +0800
Message-ID: <CAEemH2fhobsR2ethyGe2uOMk=j7KHfttn2hN3YsCv8YX7k9NNg@mail.gmail.com>
To: Xiao Yang <ice_yangxiao@163.com>
X-MC-Unique: WcKYutWnNsi8CXagbR7lUg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED PATCH] mmap1: include lapi/abisize.h header
 file
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
Cc: Zhijun Wang <zhijwang@redhat.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0080604557=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0080604557==
Content-Type: multipart/alternative; boundary="00000000000058b5880598740934"

--00000000000058b5880598740934
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 11:35 AM Xiao Yang <ice_yangxiao@163.com> wrote:

> ...
>
>
>> This sounds familiar:
>>   74d9fe32fda9 ("mtest06/mmap1: add missing lapi/abisize.h include")
>>
>
> Ah, sorry I was blind for missing this commit. Seems I just git pull&push
> my patch.
>
> Hi Li,
>
> Perhaps, you should git revert the duplicated patch. :-)
>
Ok sure, but it doesn't matter for including twice I guess. :)

--=20
Regards,
Li Wang

--00000000000058b5880598740934
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Nov 29, 2019 at 11:35 AM Xiao Yang &lt;<a h=
ref=3D"mailto:ice_yangxiao@163.com">ice_yangxiao@163.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <div><span class=3D"gmail_default" style=3D"font-size:small">...</span>=
</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            This sounds familiar:<br>
            =C2=A0 74d9fe32fda9 (&quot;mtest06/mmap1: add missing lapi/abis=
ize.h
            include&quot;)<br>
          </blockquote>
          <div><br>
          </div>
          <div style=3D"font-size:small">Ah, sorry I
            was blind for missing this commit. Seems I just git
            pull&amp;push my patch.</div>
        </div>
      </div>
    </blockquote>
    <p>Hi Li,</p>
    <p>Perhaps, you should git revert the duplicated patch. <span><span>:-)=
</span></span></p></div></blockquote><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Ok sure, but it doesn&#39;t matter for including twic=
e I guess. :)</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--00000000000058b5880598740934--


--===============0080604557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0080604557==--

