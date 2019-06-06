Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A837BEB
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 20:10:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55B0B3EA4B8
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 20:10:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id ECB083EA3EA
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 20:10:46 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 08B15140118A
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 20:10:46 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id s11so1972951pfm.12
 for <ltp@lists.linux.it>; Thu, 06 Jun 2019 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Qxl+VbvzHanqqleWDrYqpeA/OMVobWssQ00vn/CXpys=;
 b=YZGNDm0EwCE8fX8CpqCSBtw5UF1YWRftRKExHhfX73bYmcGtbKnUv8YFOhhSx4+9QD
 ICgC3YvPw1nrO7Mlr2sif6w56eY3yT50EaFqGzhzfA4YbAbIG2zz4UVbEA0UZEtYf093
 wxtPW+1Y5oSwRU4E1O827mVauWXPG1rFzFkJVDgYfpzx+LhzcEo28v4VXyt4QFWfXwng
 wjyn2C4A408I0Pqvfi6zNcIiXR9F0QQKT+tF+gI+1pJs1PcMjW6s3n4Ptnpfdi/k8Ab4
 x/EzznF0ui4UJNRp9V1DUaiyih5oxEKgiqCRfMGG5XKGwTOcPLu1WMWPHzs2bUq6XdSk
 MntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Qxl+VbvzHanqqleWDrYqpeA/OMVobWssQ00vn/CXpys=;
 b=h1rVbN0sl0gsvx6tsFqBIntM3GDrtp3qyhPCCselC82HNhNaYzuQR7KIjpZz4a+SpE
 4HA5om5bBAUfgOTAm9v+OyHXM6N2WIOe2Pug3iK5HXE47ZywqwBDnb5+MJ6z27gsB/tv
 j+jpqiaKObJgWER1O/vWrHp45ZirKq5USBR2Fu9IPTYXQ4GTD9L1s+RnjLeqVw/QnRC/
 l2WK3a/QaZFszyN1CPFk02DR1CVA3xCBMji+mwGgH6ZS6iLy6KiuOxmnuC5YJiBbVxwe
 PWj7nN2H01Z+SFIE3WwVr7QkZzqD7eg4zDRaeILanGcMMa9ekKwO/K9aM7ovRf8lMIqc
 K3Dg==
X-Gm-Message-State: APjAAAVk4ybCanhJjcjIAeBcugzYt4ki2W7IgZgwhejJxaKWpYPXgLjA
 5S8C2CS6DFiD//00FJUyvjM=
X-Google-Smtp-Source: APXvYqzmEh6Ton1UKaj+BeTF+K/IjUVi+g2NcX334oMhQMhXh5TNHDRYFFPR/oND1YgIOGlRy3c8XQ==
X-Received: by 2002:a17:90a:9903:: with SMTP id
 b3mr1146400pjp.80.1559844643839; 
 Thu, 06 Jun 2019 11:10:43 -0700 (PDT)
Received: from [192.168.20.7] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id d9sm2529192pgl.20.2019.06.06.11.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 11:10:43 -0700 (PDT)
From: Enji Cooper <yaneurabeya@gmail.com>
Message-Id: <F97F23A1-18C6-4B90-B297-F464DD0C568B@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 6 Jun 2019 11:10:42 -0700
In-Reply-To: <20190606143017.2233-1-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
References: <20190606143017.2233-1-pvorel@suse.cz>
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] shell: Fix tst_get_unused_port endianity
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0819726528=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============0819726528==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C03AC75E-2C74-4F4A-8D33-2396B9E09347"


--Apple-Mail=_C03AC75E-2C74-4F4A-8D33-2396B9E09347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 6, 2019, at 7:30 AM, Petr Vorel <pvorel@suse.cz> wrote:
>=20
> tst_get_unused_port is a shell helper, therefore it should use host
> byte order (we're not expecting this value would be added directly to
> sockaddr_in structure, which require network byte order).
> Wrap TST_GET_UNUSED_PORT() with ntohs() to achieve it.
>=20
> Reported-by: Christian Amann <camann@suse.com>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>=20
> I guess we didn't noticed this in shell script as sendfile01 is the =
only
> one not requiring root (dns-stress, tst_net_stress.sh, ssh-stress, =
ssh-stress03-rmt do require it).
>=20
> I tested patch with little script (could be easily converted to proper
> test placed in lib/newlib_tests/)
>=20
> export PATH=3D"/opt/ltp/testcases/bin/:$PATH"
> i=3D0
> while [ $i -lt 2048 ]; do
>    for j in ipv4 ipv6; do
>        for k in stream dgram; do
>            p=3D"$(tst_get_unused_port $j $k)"
>            printf "$i ($j $k): $p "
>            if [ $p -lt 1024 ]; then
>                echo "(bad)"
>                exit 1
>            else
>                echo "(ok)"
>            fi
>        done
>    done
>    i=3D$((i+1))
> done
> echo "Test was ok"
>=20
> testcases/lib/tst_get_unused_port.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/testcases/lib/tst_get_unused_port.c =
b/testcases/lib/tst_get_unused_port.c
> index 0173f1634..a843cc6e3 100644
> --- a/testcases/lib/tst_get_unused_port.c
> +++ b/testcases/lib/tst_get_unused_port.c
> @@ -54,6 +54,6 @@ int main(int argc, char *argv[])
> 		return 1;
> 	}
>=20
> -	printf("%d", TST_GET_UNUSED_PORT(family, type));
> +	printf("%d", ntohs(TST_GET_UNUSED_PORT(family, type)));
> 	return 0;
> }
> --=20
> 2.21.0

Reviewed-by: Enji Cooper <yaneurabeya@gmail.com =
<mailto:yaneurabeya@gmail.com>>

Thanks!
-Enji=

--Apple-Mail=_C03AC75E-2C74-4F4A-8D33-2396B9E09347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Jun 6, 2019, at 7:30 AM, Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" =
class=3D"">pvorel@suse.cz</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">tst_get_unused_port is a shell helper, therefore it should =
use host<br class=3D"">byte order (we're not expecting this value would =
be added directly to<br class=3D"">sockaddr_in structure, which require =
network byte order).<br class=3D"">Wrap TST_GET_UNUSED_PORT() with =
ntohs() to achieve it.<br class=3D""><br class=3D"">Reported-by: =
Christian Amann &lt;<a href=3D"mailto:camann@suse.com" =
class=3D"">camann@suse.com</a>&gt;<br class=3D"">Suggested-by: Cyril =
Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" =
class=3D"">chrubis@suse.cz</a>&gt;<br class=3D"">Signed-off-by: Petr =
Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" =
class=3D"">pvorel@suse.cz</a>&gt;<br class=3D"">---<br class=3D"">Hi,<br =
class=3D""><br class=3D"">I guess we didn't noticed this in shell script =
as sendfile01 is the only<br class=3D"">one not requiring root =
(dns-stress, tst_net_stress.sh, ssh-stress, ssh-stress03-rmt do require =
it).<br class=3D""><br class=3D"">I tested patch with little script =
(could be easily converted to proper<br class=3D"">test placed in =
lib/newlib_tests/)<br class=3D""><br class=3D"">export =
PATH=3D"/opt/ltp/testcases/bin/:$PATH"<br class=3D"">i=3D0<br =
class=3D"">while [ $i -lt 2048 ]; do<br class=3D""> =
&nbsp;&nbsp;&nbsp;for j in ipv4 ipv6; do<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for k in stream dgram; do<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;p=3D"$(t=
st_get_unused_port $j $k)"<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf =
"$i ($j $k): $p "<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if [ =
$p -lt 1024 ]; then<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;echo "(bad)"<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;exit 1<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;echo "(ok)"<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fi<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;done<br class=3D""> =
&nbsp;&nbsp;&nbsp;done<br class=3D""> &nbsp;&nbsp;&nbsp;i=3D$((i+1))<br =
class=3D"">done<br class=3D"">echo "Test was ok"<br class=3D""><br =
class=3D""> testcases/lib/tst_get_unused_port.c | 2 +-<br class=3D""> 1 =
file changed, 1 insertion(+), 1 deletion(-)<br class=3D""><br =
class=3D"">diff --git a/testcases/lib/tst_get_unused_port.c =
b/testcases/lib/tst_get_unused_port.c<br class=3D"">index =
0173f1634..a843cc6e3 100644<br class=3D"">--- =
a/testcases/lib/tst_get_unused_port.c<br class=3D"">+++ =
b/testcases/lib/tst_get_unused_port.c<br class=3D"">@@ -54,6 +54,6 @@ =
int main(int argc, char *argv[])<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
1;<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D""><br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>printf("%d", TST_GET_UNUSED_PORT(family, type));<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>printf("%d", ntohs(TST_GET_UNUSED_PORT(family, type)));<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return 0;<br class=3D""> }<br class=3D"">-- <br =
class=3D"">2.21.0<br class=3D""></div></div></blockquote></div><br =
class=3D""><div class=3D"">Reviewed-by: Enji Cooper &lt;<a =
href=3D"mailto:yaneurabeya@gmail.com" =
class=3D"">yaneurabeya@gmail.com</a>&gt;</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks!</div><div =
class=3D"">-Enji</div></body></html>=

--Apple-Mail=_C03AC75E-2C74-4F4A-8D33-2396B9E09347--

--===============0819726528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0819726528==--
