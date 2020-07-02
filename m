Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D413212097
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 12:08:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA9813C1D76
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 12:08:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9DE603C04FD
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 12:08:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B74DF1A01152
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 12:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593684515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q4eYFSI9Z/KR8fGCIQi9shH4L48X5hjp/ImgTIGf/Yg=;
 b=G4Dl2KbjJQKg1l2DKKHEeDZvUfeTwyHDNgXldqqlOn134DiSlkUkb26qumecSi5aof77jP
 IZDm8bxMe1STFMTE1hKTWcwAEWjCPkKSwExwBL/MYqsbhsNpOSTSYuoezUGNBXipgHoPWG
 NmKECSkPMMIxnS7GmxEdXlTbs/v9xo0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-treC955PM6yZENHbHi7Scg-1; Thu, 02 Jul 2020 06:08:30 -0400
X-MC-Unique: treC955PM6yZENHbHi7Scg-1
Received: by mail-lj1-f199.google.com with SMTP id l20so1235123lje.2
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 03:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4eYFSI9Z/KR8fGCIQi9shH4L48X5hjp/ImgTIGf/Yg=;
 b=i8Lk/jEAq3bE2IPRVRQ6KNSjsoHiGfC0gVtlcOKyZO52QBUvI1txXY8qQ+gCnLbbnd
 3mv29s7+U75QDf5CbZ5ZB3vu5jqOiUSzTzimFO1useTreSgQEKrb31lhmb9bPsQ9b/Pm
 EJGEFrPpp67IIU24meLdajTM23aMFgy2RNHCi5snH0mWs9/GRtiKylJ2DfDKEb8ddc2h
 HHZZAV+hlmiBdL7dCVJUGY1QE4UuJ5mTyybzqvNfUYu4BhK0+OYFkBwSDKlLGYoDXN33
 i7suvyi00efgxGQrBZR8AN6QpUJlcQEOslbCaFBPzOwrLSH1nhqgehOmtyAR6uPQd32/
 bEyQ==
X-Gm-Message-State: AOAM532Jz0GNm7kglXYvVo3WiMwaadEMLmoY/IQ2rQpmEeCjPOVb8OVb
 BP3VHTWmYpNIhZY4JvL5PppQ0boK6HO5wD+U2gfjrk421KMIPJh5nUNBjmcJXhh6MH14FGAIZqJ
 ju15cMk39mJX7rLTqfPoxmM2CNLE=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr16128287lji.468.1593684508532; 
 Thu, 02 Jul 2020 03:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xKrJWjtl6o3rpMrMTfyCWrhc5WFicSC6Vo1WMFi/er4LuX9wen9D4uO9v6AqoQ3tZuTPEg1qLkbThWLpUVU=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr16128278lji.468.1593684508284; 
 Thu, 02 Jul 2020 03:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200702095029.35220-1-harish@linux.ibm.com>
In-Reply-To: <20200702095029.35220-1-harish@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 2 Jul 2020 18:08:16 +0800
Message-ID: <CAEemH2cMx601hD3u_MGME3phSPmUggzCepk46BLkAqChZ0LRog@mail.gmail.com>
To: Harish <harish@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] numa01.sh: Fix parsing numastat for given node
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
Content-Type: multipart/mixed; boundary="===============1176255567=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1176255567==
Content-Type: multipart/alternative; boundary="00000000000000304c05a9729706"

--00000000000000304c05a9729706
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 5:51 PM Harish <harish@linux.ibm.com> wrote:

> In few systems, the node numbering is not necessarily ordered.
> E.g.
>
> Per-node process memory usage (in MBs) for PID 2069 (systemd-udevd)
>                            Node 0          Node 8           Total
>                   --------------- --------------- ---------------
> ...
> ...
> ----------------  --------------- --------------- ---------------
> Total                       17.50            0.00           17.50
>
> Patch fixes parsing numastat for given node by finding its awk
> index so that proper value is utilized in the test.
>

Thanks for fixing this Harish, but I'm afraid you have to rebase your code
on Petr's last patch.
http://lists.linux.it/pipermail/ltp/2020-July/017893.html

Anyway, this patch makes sense to me.



>
> Signed-off-by: Harish <harish@linux.ibm.com>
> ---
>  testcases/kernel/numa/numa01.sh | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/numa/numa01.sh
> b/testcases/kernel/numa/numa01.sh
> index 1d626327d..fd437cd15 100755
> --- a/testcases/kernel/numa/numa01.sh
> +++ b/testcases/kernel/numa/numa01.sh
> @@ -25,15 +25,26 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
>
>  . tst_test.sh
>
> +# Awk the field matching the node value for numastat
> +# $1 - Pid number
> +# $2 - Node number
> +get_node_index()
> +{
> +       local pid=$1
> +       local nid="Node $2"
> +       echo $(numastat -p $pid | sed '3q;d' | awk -F
> '[[:space:]][[:space:]]+' \
> +               -v node="$nid" '{ for (i = 1; i <= NF; ++i) if($i==node)
> print i; exit }')
> +}
> +
>  # Extracts the value of given numa node from the `numastat -p` output.
>  # $1 - Pid number.
>  # $2 - Node number.
>  extract_numastat_p()
>  {
>         local pid=$1
> -       local node=$(($2 + 2))
> +       local index=$(echo "$(get_node_index $pid $2)")
>
> -       echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
> +       echo $(numastat -p $pid |awk '/^Total/ {print $'$index'}')
>  }
>
>  check_for_support_numa()
> @@ -341,8 +352,8 @@ test9()
>                 numactl --cpunodebind=$node --membind=$node support_numa
> alloc_1huge_page &
>                 pid=$!
>                 TST_RETRY_FUNC "check_for_support_numa $pid" 0
> -
> -               Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print
> $'$((node+2))'}'))
> +               local index=$(echo "$(get_node_index $pid $node)")
> +               Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print
> $'$index'}'))
>                 Mem_huge=$((${Mem_huge%.*} * 1024))
>
>                 if [ "$Mem_huge" -lt "$HPAGE_SIZE" ]; then
> --
> 2.25.4
>
>

-- 
Regards,
Li Wang

--00000000000000304c05a9729706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 2, 2020 at 5:51 PM Harish &lt;<a href=
=3D"mailto:harish@linux.ibm.com">harish@linux.ibm.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">In few systems, the no=
de numbering is not necessarily ordered.<br>
E.g.<br>
<br>
Per-node process memory usage (in MBs) for PID 2069 (systemd-udevd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Node 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Node 8=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Total<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------=
--- --------------- ---------------<br>
...<br>
...<br>
----------------=C2=A0 --------------- --------------- ---------------<br>
Total=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A017.50=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.00=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.50<br>
<br>
Patch fixes parsing numastat for given node by finding its awk<br>
index so that proper value is utilized in the test.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Thanks =
for fixing this Harish, but I&#39;m afraid you have to rebase your code on =
Petr&#39;s last patch.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><a href=3D"http://lists.linux.it/pipermail/ltp/2020-July/017893.htm=
l">http://lists.linux.it/pipermail/ltp/2020-July/017893.html</a></div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Anyway, this patch makes sense to m=
e.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Harish &lt;<a href=3D"mailto:harish@linux.ibm.com" target=3D=
"_blank">harish@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/numa/numa01.sh | 19 +++++++++++++++----<br>
=C2=A01 file changed, 15 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01=
.sh<br>
index 1d626327d..fd437cd15 100755<br>
--- a/testcases/kernel/numa/numa01.sh<br>
+++ b/testcases/kernel/numa/numa01.sh<br>
@@ -25,15 +25,26 @@ TST_NEEDS_CMDS=3D&quot;awk bc numactl numastat&quot;<br=
>
<br>
=C2=A0. tst_test.sh<br>
<br>
+# Awk the field matching the node value for numastat<br>
+# $1 - Pid number<br>
+# $2 - Node number<br>
+get_node_index()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local pid=3D$1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local nid=3D&quot;Node $2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid | sed &#39;3q;d&#39; | =
awk -F &#39;[[:space:]][[:space:]]+&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-v node=3D&quot;$ni=
d&quot; &#39;{ for (i =3D 1; i &lt;=3D NF; ++i) if($i=3D=3Dnode) print i; e=
xit }&#39;)<br>
+}<br>
+<br>
=C2=A0# Extracts the value of given numa node from the `numastat -p` output=
.<br>
=C2=A0# $1 - Pid number.<br>
=C2=A0# $2 - Node number.<br>
=C2=A0extract_numastat_p()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local pid=3D$1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local node=3D$(($2 + 2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local index=3D$(echo &quot;$(get_node_index $pi=
d $2)&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid |awk &#39;/^Total/ {pri=
nt $&#39;$node&#39;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid |awk &#39;/^Total/ {pri=
nt $&#39;$index&#39;}&#39;)<br>
=C2=A0}<br>
<br>
=C2=A0check_for_support_numa()<br>
@@ -341,8 +352,8 @@ test9()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 numactl --cpunodebi=
nd=3D$node --membind=3D$node support_numa alloc_1huge_page &amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D$!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_RETRY_FUNC &quo=
t;check_for_support_numa $pid&quot; 0<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mem_huge=3D$(echo $=
(numastat -p $pid |awk &#39;/^Huge/ {print $&#39;$((node+2))&#39;}&#39;))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local index=3D$(ech=
o &quot;$(get_node_index $pid $node)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mem_huge=3D$(echo $=
(numastat -p $pid |awk &#39;/^Huge/ {print $&#39;$index&#39;}&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mem_huge=3D$((${Mem=
_huge%.*} * 1024))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$Mem_hug=
e&quot; -lt &quot;$HPAGE_SIZE&quot; ]; then<br>
-- <br>
2.25.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000000304c05a9729706--


--===============1176255567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1176255567==--

